import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  final Color? color;
  const CustomLoading({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
        strokeWidth: 2, color: color ?? Colors.white);
  }
}
