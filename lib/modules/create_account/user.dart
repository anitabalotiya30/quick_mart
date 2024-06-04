import 'package:flutter/material.dart';

class User {
  final etName = TextEditingController();
  final etEmail = TextEditingController();
  final etPassword = TextEditingController();

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = etName.text;
    data['email'] = etEmail.text;
    data['password'] = etPassword.text;
    data['avatar'] = 'https://picsum.photos/800';
    return data;
  }
}
