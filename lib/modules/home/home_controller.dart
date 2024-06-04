import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_mart/helper/extensions.dart';

import '../../services/api_services.dart';
import '../../services/pref.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/widgets/create_acc_dialog.dart';
import 'filter.dart';
import 'product.dart';

class HomeController extends GetxController {
  final products = <Product>[].obs;
  final listToShow = <Product>[].obs;
  static final categoryList = <String>[];
  final status = Status.na.obs;

  //
  final etSearch = TextEditingController();
  final cartList = [].obs;

  //
  final selectedFilter = Filters.category.obs;
  final filterList = List.generate(
      Filters.values.length,
      (i) =>
          FilterModel(filter: Filters.values[i], list: Filters.values[i].list));

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
      mainList.forEach((e) {
        final p = Product.fromJson(e);
        products.add(p);
        categoryList.add(p.category?.name ?? '');
      });
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

  void onApplyFilter() {
    listToShow.clear();

    final category = filterList
        .firstWhere((e) => e.filter == Filters.category)
        .selectedListItem
        .value
        .toLowerCase();
    final price = filterList
        .firstWhere((e) => e.filter == Filters.price)
        .selectedListItem
        .value
        .toLowerCase();

    final start = price.split('-')[0].replaceAll('\$', '').toInt;
    final end = price.split('-')[1].replaceAll('\$', '').toInt;

    listToShow.addAll(products.where((p) =>
        p.category!.name!.toLowerCase().contains(category) &&
        (p.price! >= start && p.price! <= end)));
    log('list ---- ${listToShow.length}');
    Get.back();
  }
}
