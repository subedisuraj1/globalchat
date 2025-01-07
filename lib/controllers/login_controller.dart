import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/screens/dashboard_screen.dart';

class LoginController {
  static Future<void> login(
      {required BuildContext context,
      required email,
      required password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return DashboradScreen();
        },
      ), (route) {
        return false;
      });
      print("Account created sucessfully");
    } catch (e) {
      SnackBar messageSnackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          e.toString(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
      print(e);
    }
  }
}
