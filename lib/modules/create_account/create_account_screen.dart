import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';
import '../../utils/widgets/custom_btn.dart';
import '../../utils/widgets/custom_text_field.dart';
import '../../utils/widgets/guest_btn.dart';
import 'create_account_controller.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final _c = Get.put(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //
        appBar: AppBar(title: const Text('Create Account')),

        //
        body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .02),

            //
            children: [
              CustomTextField(
                  etText: _c.user.etName,
                  label: 'Name',
                  textInputType: TextInputType.name),
              SizedBox(height: mq.height * .03),

              //
              CustomTextField(
                  etText: _c.user.etEmail,
                  label: 'Email',
                  textInputType: TextInputType.emailAddress),
              SizedBox(height: mq.height * .03),

              //
              CustomTextField(etText: _c.user.etPassword, label: 'Password'),
              SizedBox(height: mq.height * .03),

              //
              CustomTextField(
                  etText: _c.etConfirmPassword, label: 'Confirm Password'),
              SizedBox(height: mq.height * .1),

              //
              CustomBtn(text: 'Create', onTap: () => _c.onClickCreate()),

              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                //
                children: [
                  const Text('Already have an account?'),
                  //register btn
                  TextButton(
                      onPressed: Get.back,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              //

              const Text('OR', textAlign: TextAlign.center),

              // guest btn
              const GuestBtn()
            ]));
  }
}
