import 'dart:math';

import 'package:firebase_learn/global/fonts.dart';
import 'package:firebase_learn/widget/button/back_button_custome.dart';
import 'package:firebase_learn/widget/button/normal_button.dart';
import 'package:firebase_learn/widget/modal/dynamic_alert.dart';
import 'package:flutter/material.dart';
import '../data/firebase_handler.dart';
import '../global/colors.dart';
import '../widget/box_input/password_input.dart';
import '../widget/box_input/text_normal_input.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final name = TextEditingController();
  final repassword = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final User? user = FirebaseAuth.instance.currentUser;

  final String newUserName = 'John Doe';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BackButtonCustome(),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/logo.jpg', scale: 5),
                ),
                const SizedBox(height: 20),
                Text('Sign Up', style: h1(cPremier)),
                const SizedBox(height: 20),
                TextNormalInput(hintText: 'Name', text: name),
                const SizedBox(height: 10),
                TextNormalInput(hintText: 'Email', text: email),
                const SizedBox(height: 10),
                PasswordInput(hintText: 'Password', text: password),
                const SizedBox(height: 10),
                PasswordInput(hintText: 'Re-Password', text: repassword),
                const SizedBox(height: 10),
                const SizedBox(height: 40),
                GestureDetector(
                    onTap: () => checkRegistration(context),
                    child: const NormalButton(title: 'Register'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkRegistration(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (name.text == '' ||
        email.text == '' ||
        password.text == '' ||
        repassword.text == '') {
      alertDynamic(context, 'Oops', 'lengkapi data diri');
    } else if (name.text.length < 3 || name.text.length > 50) {
      alertDynamic(context, 'Oops', 'Periksa nama');
    } else if (password.text.length < 8 || !isPasswordValid(password.text)) {
      alertDynamic(context, 'Oops', 'Password salah');
    } else if (password.text != repassword.text) {
      alertDynamic(context, 'Oops', 'Password salah');
    } else if (!isValidEmail(email.text)) {
      alertDynamic(context, 'Oops', 'Periksa kembali email');
    } else {
      Random random = Random();
      int min = 10000;
      int max = 99999;
      int randomNumber = min + random.nextInt(max - min + 1);

      createCollection(
        context,
        email.text,
        name.text,
        password.text,
        randomNumber,
      );
    }
  }

  bool isPasswordValid(String password) {
    final RegExp lowercaseRegex = RegExp(r'[a-z]');
    final RegExp uppercaseRegex = RegExp(r'[A-Z]');

    bool hasLowercase = lowercaseRegex.hasMatch(password);
    bool hasUppercase = uppercaseRegex.hasMatch(password);

    return hasLowercase && hasUppercase;
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return emailRegex.hasMatch(email);
  }
}
