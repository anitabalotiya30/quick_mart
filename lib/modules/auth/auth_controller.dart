import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_mart/helper/extensions.dart';

import '../../helper/my_dialog.dart';
import '../../services/api_services.dart';
import '../home/home_screen.dart';

class AuthController extends GetxController {
  final etEmail = TextEditingController();
  final etPassword = TextEditingController();

  Future<void> onClickContinue() async {
    final email = etEmail.text;
    final password = etPassword.text;

    if (email.isValid && password.isValid) {
      if (!email.isEmail) {
        MyDialog.error(msg: 'Please enter valid email address.');
        return;
      }
      MyDialog.showProgressBar();
      final authenticate = await ApiServices.authenticateUser(
          email: etEmail.text, password: etPassword.text);

      //
      if (authenticate) Get.offAll(() => const HomeScreen());
    } else {
      MyDialog.error(msg: 'Please provide your email & password.');
    }
  }
}
