import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_mart/helper/my_dialog.dart';

import '../../services/api_services.dart';
import '../../services/pref.dart';
import '../home/home_screen.dart';

class AuthController extends GetxController {
  final etEmail = TextEditingController(text: 'john@mail.com');
  final etPassword = TextEditingController(text: 'changeme');

  Future<void> onClickContinue() async {
    MyDialog.showProgressBar();
    final authenticate = await ApiServices.authenticateUser(
        email: etEmail.text, password: etPassword.text);

    log('accessToken --- ${Pref.userToken}');
    log('authenticate --- $authenticate');
    if (authenticate) {
      Get.offAll(() => const HomeScreen());
    }
  }
}
