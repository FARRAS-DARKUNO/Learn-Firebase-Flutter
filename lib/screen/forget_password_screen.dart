import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../global/colors.dart';
import '../global/fonts.dart';
import '../widget/box_input/text_normal_input.dart';
import '../widget/button/back_button_custome.dart';
import '../widget/button/normal_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final email = TextEditingController();

  String password = '';

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
                Text('Forget Password', style: h1(cPremier)),
                const SizedBox(height: 20),
                TextNormalInput(hintText: 'email', text: email),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () => getDataPassword(),
                  child: const NormalButton(title: 'Check Password'),
                ),
                const SizedBox(height: 20),
                password == ''
                    ? Container()
                    : Text('Password: \n $password',
                        style: body(cPremier), textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getDataPassword() async {
    try {
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('User').doc(email.text);
      DocumentSnapshot snapshot = await userDocRef.get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        setState(() {
          password = data['password'];
        });
      } else {
        setState(() {
          password = 'Email no Exists';
        });
      }
    } catch (_) {
      print('error');
    }
  }
}
