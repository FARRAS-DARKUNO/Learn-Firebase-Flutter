import 'package:firebase_learn/screen/forget_password_screen.dart';
import 'package:firebase_learn/screen/home_screen.dart';
import 'package:firebase_learn/screen/login_screen.dart';
import 'package:firebase_learn/screen/register_screen.dart';
import 'package:flutter/cupertino.dart';

gotoRegister(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    title: "Click me",
    builder: (BuildContext context) => RegisterScreen(),
  ));
}

gotoHome(BuildContext context, String email) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    title: "Click me",
    builder: (BuildContext context) => HomeScreen(email: email),
  ));
}

gotoLogin(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    title: "Click me",
    builder: (BuildContext context) => LoginScreen(),
  ));
}

gotoForgetPassword(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    title: "Click me",
    builder: (BuildContext context) => ForgetPasswordScreen(),
  ));
}

goBack(BuildContext context) {
  Navigator.pop(context);
}
