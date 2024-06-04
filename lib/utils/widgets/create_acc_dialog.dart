import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';
import '../../modules/auth/auth_screen.dart';
import '../constants/str_const.dart';
import 'custom_btn.dart';

class CreateAccDialog {
  void onTap() {
    Get.dialog(AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(
            horizontal: mq.width * .02, vertical: mq.height * .01),

        //
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),

        //
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(CupertinoIcons.xmark_circle, size: 26))),

          SizedBox(height: mq.width * .02),

          Image.asset(StrConst.empty, height: mq.height * .15),
          SizedBox(height: mq.width * .01),

          //
          const Text(
              'To add your favorite items to your cart, please Resister/Create account.',
              textAlign: TextAlign.center),

          SizedBox(height: mq.height * .015),

          CustomBtn(
              onTap: () => Get.to(() => AuthScreen()),
              text: 'Continue',
              paddingH: mq.width * .08,
              paddingV: mq.width * .02,
              fontSize: 15.5),
          SizedBox(height: mq.height * .015)
        ])));
  }
}
