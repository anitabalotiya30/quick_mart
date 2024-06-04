import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../helper/global.dart';
import 'custom_btn.dart';

class ExitDialog {
  static void onTap() {
    Get.dialog(AlertDialog(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(14),

        //
        content: Column(
            mainAxisSize: MainAxisSize.min,

            //
            children: [
              IconButton(
                  onPressed: Get.back,
                  icon: const Icon(CupertinoIcons.xmark_circle,
                      size: 32, color: Colors.white)),
              SizedBox(height: mq.height * .015),

              //
              Container(
                  width: mq.width * .8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(28))),
                  //
                  padding: EdgeInsets.symmetric(
                      vertical: mq.height * .03, horizontal: mq.width * .04),

                  //
                  child: Column(
                      //
                      children: [
                        const Text('Rate Us',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        SizedBox(height: mq.height * .02),

                        //
                        InkWell(
                            onTap: () {
                              Get.back();
                              if (Platform.isAndroid) {
                                launchUrlString(
                                    "market://details?id=$packageName",
                                    mode: LaunchMode.externalApplication);
                              }
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    5,
                                    (i) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),

                                        //
                                        child: Icon(
                                            i > 2
                                                ? Icons.star_border_rounded
                                                : Icons.star_rate_rounded,
                                            size: 36,
                                            color: i > 2
                                                ? Colors.black45
                                                : Colors.amber))))),

                        //
                        Padding(
                            padding: EdgeInsets.only(
                                top: mq.height * .02, bottom: mq.height * .01),
                            child: const Text('Do you want to exit the app?',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500))),

                        //
                        CustomBtn(
                            onTap: () => SystemNavigator.pop(),
                            text: 'Exit',
                            paddingH: mq.width * .24)
                      ]))
            ])));
  }
}
