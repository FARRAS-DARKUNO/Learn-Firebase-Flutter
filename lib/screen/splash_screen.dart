import 'package:firebase_learn/global/size.dart';
import 'package:firebase_learn/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

getToken(context) async {
  final pref = await SharedPreferences.getInstance();
  var token = pref.getString('Token') ?? '';
  var email = pref.getString('Email') ?? '';
  if (token == '') {
    Future.delayed(const Duration(seconds: 2)).then((_) => gotoLogin(context));
  } else {
    Future.delayed(const Duration(seconds: 2))
        .then((_) => gotoHome(context, email));
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    getToken(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: cWhite,
        width: sWidthFull(context),
        height: sHeightFull(context),
        child: Image.asset('assets/images/logo.jpg', scale: 3),
      ),
    );
  }
}
