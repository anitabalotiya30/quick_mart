import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_mart/helper/extensions.dart';

import '../../helper/global.dart';
import '../../utils/widgets/custom_btn.dart';
import '../../utils/widgets/custom_loading.dart';
import '../../utils/widgets/custom_text_field.dart';
import '../../utils/widgets/exit_dialog.dart';
import '../../utils/widgets/product_card.dart';
import '../cart/cart_screen.dart';
import 'filter.dart';
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
    return PopScope(
      canPop: false,
      onPopInvoked: (v) => ExitDialog.onTap(),

      //
      child: Scaffold(
        //
        appBar: AppBar(
            title: const Text(appName),
            centerTitle: false,
            automaticallyImplyLeading: false,

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
                                e.category!.name!
                                    .toLowerCase()
                                    .contains(text) ||
                                e.title!.toLowerCase().contains(text) ||
                                e.description!.toLowerCase().contains(text)));
                          } else {
                            _c.listToShow.addAll(_c.products);
                          }
                        })),

                // for filter product
                IconButton(
                    tooltip: 'Filter',
                    onPressed: () => _FilterBottomsheet().onTap(context, c: _c),
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
                        : _c.status.value == Status.completed &&
                                _c.listToShow.isNotEmpty
                            ? Wrap(
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
                              )
                            : const Text('No Data Found.'),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterBottomsheet {
  void onTap(BuildContext context, {required HomeController c}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        constraints:
            BoxConstraints.expand(width: mq.width, height: mq.height * .3),

        //
        builder: (context) => Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                //
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: mq.width * .04),
                      child: const Text('Apply Filter',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18))),
                  IconButton(
                      onPressed: Get.back,
                      icon: const Icon(CupertinoIcons.xmark_circle))
                ],
              ),

              //
              const Divider(),

              //
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mq.width * .02),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    //
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...Filters.values.map((e) => InkWell(
                                onTap: () => c.selectedFilter.value = e,

                                //
                                child: Obx(() => _text(
                                    e.title, c.selectedFilter.value == e))))
                          ]),

                      //
                      SizedBox(width: mq.width * .03),

                      ...c.filterList.map((filter) => Obx(() {
                            final selected = filter.selectedListItem.value;
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //
                                  if (c.selectedFilter.value == filter.filter)
                                    ...filter.list.map((e) => InkWell(
                                        onTap: () =>
                                            filter.selectedListItem.value = e,
                                        child: _text(
                                            '$e  ${selected == e ? '✔' : ''}',
                                            selected == e)))
                                ]);
                          }))
                    ]),
              ),
              SizedBox(height: mq.height * .04),

              //
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mq.width * .02),

                //
                child: Row(
                  children: [
                    //
                    Expanded(
                        child: CustomBtn(
                            onTap: () {
                              c.listToShow.clear();
                              c.listToShow.addAll(c.products);
                              Get.back();
                            },
                            fontSize: 16,
                            whiteBtn: true,
                            paddingH: mq.width * .04,
                            text: 'Clear All')),
                    SizedBox(width: mq.width * .02),

                    //
                    Expanded(
                      child: CustomBtn(
                          onTap: () => c.onApplyFilter(),
                          fontSize: 16,
                          paddingH: mq.width * .04,
                          text: 'Apply'),
                    ),
                  ],
                ),
              )
            ]));
  }

  Widget _text(String text, bool selected) => Padding(

      //
      padding: EdgeInsets.symmetric(
          vertical: mq.width * .01, horizontal: mq.width * .015),

      //
      child: Text(text,
          textAlign: TextAlign.start,

          //
          style: TextStyle(
              letterSpacing: -.2,
              fontSize: selected ? 15 : 16,

              //
              color: selected ? pColor : Colors.black87,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500)));
}
