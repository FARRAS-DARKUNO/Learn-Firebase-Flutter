import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/utils/route.dart';
import 'package:firebase_learn/widget/modal/dynamic_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> createCollection(
  BuildContext context,
  String email,
  String name,
  String password,
  dynamic token,
) async {
  try {
    final docUser = FirebaseFirestore.instance.collection('User').doc(email);

    final json = {
      'name': name,
      'email': email,
      'password': password,
      'isValidation': false,
      'token': token
    };
    await docUser.set(json).then((value) {
      goBack(context);
      alertDynamic(context, "Congratulation", 'Your Accound is Ready');
    });
  } catch (e) {
    print('Error creating collection: $e');
  }
}

searchDocuments(
  BuildContext context,
  String email,
  String password,
) async {
  final pref = await SharedPreferences.getInstance();

  CollectionReference usersRef = FirebaseFirestore.instance.collection('User');

  QuerySnapshot querySnapshot = await usersRef
      .where('email', isEqualTo: email)
      .where('password', isEqualTo: password)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    await pref.setString('Email', email);
    gotoHome(context, email);
  } else {
    alertDynamic(context, 'Oops', 'email and password is wrong');
  }
}

Future<void> updateCollection(
  BuildContext context,
  String email,
) async {
  try {
    final docUser = FirebaseFirestore.instance.collection('User').doc(email);

    final json = {'isValidation': true};

    await docUser.update(json).then((value) {
      alertDynamic(
          context, "Congratulation", 'Verivication di firebase berhasil');
    });
  } catch (e) {
    print('Error creating collection: $e');
  }
}
