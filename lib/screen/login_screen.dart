import 'package:firebase_learn/global/colors.dart';
import 'package:firebase_learn/global/fonts.dart';
import 'package:firebase_learn/global/size.dart';
import 'package:firebase_learn/utils/route.dart';
import 'package:firebase_learn/widget/button/normal_button.dart';
import 'package:firebase_learn/widget/modal/dynamic_alert.dart';
import 'package:flutter/material.dart';

import '../data/firebase_handler.dart';
import '../widget/box_input/password_input.dart';
import '../widget/box_input/text_normal_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final email = TextEditingController();

  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: sHeightFull(context),
            width: sWidthFull(context),
            alignment: Alignment.center,
            color: cWhite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/logo.jpg', scale: 3.5),
                  ),
                  const SizedBox(height: 30),
                  Text("Login", style: h1(cPremier)),
                  const SizedBox(height: 30),
                  TextNormalInput(hintText: 'Email', text: email),
                  const SizedBox(height: 10),
                  PasswordInput(hintText: 'Password', text: password),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () => checkLogin(context),
                    child: const NormalButton(title: 'Login'),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    width: sWidthDynamic(context, 1) - 40,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                        onTap: () => gotoForgetPassword(context),
                        child: Text('Forget Password?', style: body(cPremier))),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    width: sWidthDynamic(context, 1) - 40,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () => gotoRegister(context),
                      child: Text('Registration', style: body(cPremier)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkLogin(BuildContext context) {
    if (password.text == '' || email.text == '') {
      alertDynamic(context, 'Oops', 'Masukan email dan passwod');
    } else {
      searchDocuments(context, email.text, password.text);
    }
  }
}
