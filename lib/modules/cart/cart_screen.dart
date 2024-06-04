import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';
import '../../utils/constants/str_const.dart';
import '../../utils/widgets/custom_btn.dart';
import '../../utils/widgets/custom_network_img.dart';
import '../home/home_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    const hStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);

    //
    return Scaffold(
        appBar: AppBar(title: const Text('Cart')),

        //
        body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                left: mq.width * .03,
                right: mq.width * .03,
                top: mq.height * .02,
                bottom: mq.height * .08),

            //
            children: [
              //
              Obx(
                () => _homeC.cartList.isNotEmpty
                    ? Column(children: [
                        ..._homeC.products
                            .where((p) => _homeC.cartList.contains(p.id))
                            .map((e) => Card(
                                elevation: .6,
                                color: Colors.white,

                                //
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: mq.width * .02,
                                        vertical: mq.height * .01),

                                    //
                                    child: Row(children: [
                                      //
                                      CustomNetworkImage(
                                          url: e.images!.first,
                                          height: mq.height * .14,
                                          width: mq.width * .25,
                                          fit: BoxFit.contain),
                                      SizedBox(width: mq.width * .02),

                                      //
                                      Flexible(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,

                                              //
                                              children: [
                                            Text(e.title ?? '',
                                                textAlign: TextAlign.start,

                                                //
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),

                                            SizedBox(
                                              height: mq.width * .01,
                                            ),

                                            Text(e.description ?? '',
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,

                                                //
                                                style: const TextStyle(
                                                    fontSize: 13.5)),
                                            SizedBox(height: mq.width * .02),

                                            //
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('\$${e.price}',
                                                      style: hStyle),

                                                  //
                                                  // remove item from cart
                                                  CustomBtn(
                                                      onTap: () =>
                                                          _homeC.onClickCart(
                                                              e.id ?? 0),
                                                      text: 'Remove',
                                                      fontSize: 12,
                                                      paddingH: mq.height * .02,
                                                      paddingV: mq.width * .015)
                                                ]),
                                          ]))
                                    ]))))
                      ])
                    : Column(
                        children: [
                          SizedBox(height: mq.height * .1),
                          Image.asset(StrConst.empty, height: mq.height * .22),

                          //
                          const Text('Your cart is empty.', style: hStyle),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mq.width * .07,
                                  vertical: mq.height * .01),

                              //
                              child: const Text(
                                  'Please start browsing and add items to your cart. We\'ll help you find top-notch products.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      letterSpacing: -.1))),

                          //
                          SizedBox(height: mq.height * .02),
                          CustomBtn(
                            onTap: () => Get.back(),
                            fontSize: 14.5,
                            paddingH: mq.width * .06,
                            paddingV: mq.width * .018,
                            text: 'Start Shopping',
                          )
                        ],
                      ),
              ).animate(delay: 400.ms).fadeIn(duration: 400.ms)
            ]));
  }
}
