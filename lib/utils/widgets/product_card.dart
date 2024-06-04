import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';
import '../../modules/home/home_controller.dart';
import '../../modules/home/product.dart';
import 'custom_network_img.dart';

class ProductCard extends StatelessWidget {
  final homeC = Get.find<HomeController>();
  final Product product;

  ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    //
    return Card(
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.all(Radius.circular(18))),

        //
        color: const Color(0XFFf9f9f9),
        elevation: .4,

        //
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .02),

            //
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //
                  CustomNetworkImage(
                      url: product.images?.first, height: mq.height * .15),
                  SizedBox(height: mq.height * .01),

                  // title
                  Text(product.title ?? '',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),

                  //
                  Text(product.description ?? '',
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 6),

                  //
                  Row(children: [
                    Text('\$${product.price}',
                        style: const TextStyle(
                            color: pColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.5)),

                    SizedBox(width: mq.width * .02),

                    //
                    Obx(() => Flexible(
                          child: TextButton(
                              onPressed: () => homeC.onClickCart(product.id!),

                              //
                              style: TextButton.styleFrom(
                                  backgroundColor: sColor,
                                  fixedSize: Size(mq.width * .3, 10)),

                              //
                              child: Text(
                                  '🛒 ${!homeC.cartList.contains(product.id) ? 'Add' : 'Remove'}',
                                  style: const TextStyle(fontSize: 14))),
                        ))
                  ])
                ])));
  }
}
