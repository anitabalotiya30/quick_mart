import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/widgets/custom_loading.dart';
import 'global.dart';

class MyDialog {
  static void error({required String msg}) {
    Get.snackbar('Error', msg,
        backgroundColor: Colors.redAccent.withOpacity(.8),
        colorText: Colors.white);
  }

  static void success({required String msg}) {
    Get.snackbar('Success', msg,
        backgroundColor: pColor.withOpacity(.8), colorText: Colors.white);
  }

  static void info({required String msg}) {
    Get.snackbar('Info', msg,
        backgroundColor: Colors.white.withOpacity(.8), colorText: pColor);
  }

  static void showProgressBar() {
    Get.dialog(const Center(child: CustomLoading()));
  }
}
