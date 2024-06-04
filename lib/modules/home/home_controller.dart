import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_mart/utils/widgets/create_acc_dialog.dart';

import '../../services/api_services.dart';
import '../../services/pref.dart';
import '../../utils/constants/api_constants.dart';
import 'product.dart';

class HomeController extends GetxController {
  final products = <Product>[].obs;
  final listToShow = <Product>[].obs;
  final status = Status.na.obs;

  //
  final etSearch = TextEditingController();
  final cartList = [].obs;

  @override
  void onInit() {
    super.onInit();
    cartList.addAll(Pref.cartList);
    getProducts();
  }

  Future<void> getProducts() async {
    status.value = Status.loading;
    products.clear();
    listToShow.clear();
    final mainList =
        await ApiServices.getApi(endpoint: ApiConstants.getAllProducts);
    if (mainList != null) {
      mainList.forEach((e) => products.add(Product.fromJson(e)));
      listToShow.addAll(products);
      status.value = Status.completed;
    } else {
      status.value = Status.error;
    }
  }

  void onClickCart(int id) {
    if (Pref.userToken.isNotEmpty) {
      cartList.contains(id) ? cartList.remove(id) : cartList.add(id);
    } else {
      CreateAccDialog().onTap();
    }
  }
}
