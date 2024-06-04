import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_mart/helper/extensions.dart';

import '../../helper/my_dialog.dart';
import '../../services/api_services.dart';
import 'user.dart';

class CreateAccountController extends GetxController {
  final user = User();
  final etConfirmPassword = TextEditingController();

  Future<void> onClickCreate() async {
    final email = user.etEmail.text;
    final name = user.etName.text;
    final password = user.etPassword.text;
    final confirmPw = etConfirmPassword.text;

    if (email.isValid &&
        name.isValid &&
        password.isValid &&
        confirmPw.isValid) {
      if (!email.isEmail) {
        MyDialog.error(msg: 'Please enter valid email address.');
        return;
      }

      if (password != confirmPw) {
        MyDialog.error(msg: 'Password mismatch, please check.');
        return;
      }
      MyDialog.showProgressBar();
      final isUserCreated = await ApiServices.createUser(user.toJson());
      log('isUserCreated --- $isUserCreated');
    } else {
      MyDialog.error(msg: 'All fields are required.');
    }
  }
}
