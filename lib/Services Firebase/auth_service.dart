import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthService {
  login(dataaccount, context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: dataaccount['email'], password: dataaccount['password']);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text("Login Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }
}
