import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_mart/modules/auth/auth_screen.dart';
import 'package:quick_mart/modules/home/home_screen.dart';
import 'package:quick_mart/services/api_services.dart';

import '../services/pref.dart';
import '../utils/widgets/custom_loading.dart';
import '../utils/widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _getProfileData();
  }

  _getProfileData() async {
    bool exists = false;
    if (Pref.userToken.isNotEmpty) {
      exists = await ApiServices.getUserProfile(accessToken: Pref.userToken);
    }
    log('exist --- $exists, token ---- ${Pref.userToken}');
    Future.delayed(const Duration(milliseconds: 1500), () {
      Get.off(() => exists ? const HomeScreen() : AuthScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Spacer(flex: 2),

            //logo
            Logo(height: 150),

            Spacer(),

            //loading
            CustomLoading(
              color: Colors.black,
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
