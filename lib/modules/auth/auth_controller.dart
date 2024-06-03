import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/api_services.dart';
import '../home/home_screen.dart';

class AuthController extends GetxController {
  final etEmail = TextEditingController();
  final etPassword = TextEditingController();

  Future<void> onClickContinue() async {
    final authenticate = await ApiServices.authenticateUser(
        email: etEmail.text, password: etPassword.text);

    if (authenticate) {
      Get.off(() => const HomeScreen());
    }
  }
}
