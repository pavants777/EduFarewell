import 'package:clc/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashFunction {
  static Future<void> login(String email, password, context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.homePage, (route) => false);
    }).onError((error, stackTrace) {});
  }
}
