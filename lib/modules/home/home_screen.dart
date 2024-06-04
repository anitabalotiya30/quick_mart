import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_mart/helper/extensions.dart';

import '../../helper/global.dart';
import '../../utils/widgets/custom_loading.dart';
import '../../utils/widgets/custom_text_field.dart';
import '../../utils/widgets/product_card.dart';
import '../cart/cart_screen.dart';
import 'home_controller.dart';
import 'product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
          title: const Text(appName),
          centerTitle: false,

          //
          actions: [
            IconButton(
                tooltip: 'Cart',
                onPressed: () => Get.to(() => const CartScreen()),
                icon: const Icon(CupertinoIcons.cart))
          ]),

      //
      body: Column(
        children: [
          //
          Padding(
            padding:
                EdgeInsets.only(top: mq.width * .04, left: mq.height * .02),

            //
            child: Row(children: [
              // search product
              Expanded(
                  child: CustomTextField(
                      etText: _c.etSearch,
                      label: 'Search',

                      //
                      onChanged: (v) {
                        final text = v.toLowerCase();
                        _c.listToShow.clear();

                        //
                        if (_c.etSearch.text.isValid) {
                          // search from category, title & description
                          _c.listToShow.addAll(_c.products.where((e) =>
                              e.category!.name!.toLowerCase().contains(text) ||
                              e.title!.toLowerCase().contains(text) ||
                              e.description!.toLowerCase().contains(text)));
                        } else {
                          _c.listToShow.addAll(_c.products);
                        }
                      })),

              // for filter product
              IconButton(
                  tooltip: 'Filter',
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt_outlined))
            ]),
          ),
          SizedBox(height: mq.height * .02),

          Expanded(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                //
                child: Obx(
                  () => _c.status.value == Status.loading
                      ? const CustomLoading(color: Colors.black)
                      : Wrap(
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.start,
                          spacing: 8,
                          runSpacing: 6,

                          //
                          children: [
                            ..._c.listToShow.map(
                              (e) => SizedBox(
                                width: mq.width * .43,
                                child: ProductCard(product: e),
                              ),
                            )
                          ],
                        ),
                )),
          ),
        ],
      ),
    );
  }
}
