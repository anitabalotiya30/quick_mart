import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/home/home_screen.dart';

class GuestBtn extends StatelessWidget {
  const GuestBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Get.to(() => const HomeScreen()),
        child: const Text(
          'Continue as Guest',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ));
  }
}
