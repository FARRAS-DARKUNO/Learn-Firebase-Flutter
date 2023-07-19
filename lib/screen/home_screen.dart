import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/data/firebase_handler.dart';
import 'package:firebase_learn/global/colors.dart';
import 'package:firebase_learn/global/fonts.dart';
import 'package:firebase_learn/global/size.dart';
import 'package:firebase_learn/utils/route.dart';
import 'package:firebase_learn/widget/button/normal_button.dart';
import 'package:firebase_learn/widget/header/home_header.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  final String email;
  const HomeScreen({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream:
          FirebaseFirestore.instance.collection('User').doc(email).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            width: sWidthFull(context),
            height: sHeightFull(context),
            color: cWhite,
            child: Text("No Have Signal", style: h2(cPremier)),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: sWidthFull(context),
            height: sHeightFull(context),
            color: cWhite,
            child: Text("Loading", style: h2(cPremier)),
          );
        }
        DocumentSnapshot documents = snapshot.data!;

        setToken(documents['token'].toString());

        return Scaffold(
          body: SizedBox(
            width: sWidthFull(context),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeHeader(name: documents['name']),
                    const SizedBox(height: 50),
                    documents['isValidation']
                        ? Lottie.asset('assets/animations/acc.json')
                        : Lottie.asset('assets/animations/noacc.json'),
                    const SizedBox(height: 50),
                    Text(
                      documents['isValidation']
                          ? 'Your Email Valid'
                          : 'You mush Validation your email',
                      style: h2(cSekunder),
                    ),
                    const SizedBox(height: 50),
                    documents['isValidation']
                        ? Container()
                        : GestureDetector(
                            onTap: () => updateCollection(context, email),
                            child:
                                const NormalButton(title: 'Verivication Email'),
                          ),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () => logOut(context),
                        child: const NormalButton(title: 'Logout'))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  setToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("Token", token);
  }

  logOut(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    gotoLogin(context);
  }
}
