import 'package:flutter/material.dart';

extension MyTextField on TextEditingController {
  bool get isValid => text.trim().isNotEmpty;
}
