import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';
import '../../utils/constants/str_const.dart';
import '../../utils/widgets/custom_btn.dart';
import '../../utils/widgets/custom_text_field.dart';
import '../../utils/widgets/guest_btn.dart';
import '../create_account/create_account_screen.dart';
import 'auth_controller.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _c = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .04),
            //
            children: [
          // signin image
          Image.asset(
            StrConst.signIn,
            height: mq.height * .4,
          ),
          //
          CustomTextField(
              label: 'Email',
              textInputType: TextInputType.emailAddress,
              etText: _c.etEmail),
          SizedBox(height: mq.height * .04),

          //
          CustomTextField(label: 'Password', etText: _c.etPassword),

          SizedBox(
            height: mq.height * .1,
          ),

          CustomBtn(text: 'Continue', onTap: () => _c.onClickContinue()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            //
            children: [
              const Text('Don\'t have an Account?'),
              //register btn
              TextButton(
                  onPressed: () => Get.to(() => CreateAccountScreen()),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ))
            ],
          ),

          const Text('OR', textAlign: TextAlign.center),

          // guest btn
          const GuestBtn()
        ]));
  }
}
