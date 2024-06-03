import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_mart/helper/extensions.dart';

import '../../helper/my_dialog.dart';

class CreateAccountController extends GetxController {
  final etEmail = TextEditingController();
  final etName = TextEditingController();
  final etPassword = TextEditingController();
  final etConfirmPassword = TextEditingController();

  void onClickCreate() {
    if (etEmail.isValid &&
        etName.isValid &&
        etPassword.isValid &&
        etConfirmPassword.isValid) {
      log('email - ${etEmail.text}, ');
    } else {
      MyDialog.error(msg: 'All fields are required!');
    }
  }
}
