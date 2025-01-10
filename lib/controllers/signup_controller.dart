import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/screens/dashboard_screen.dart';

class SignupController {
  static Future<void> createAccount({
    required BuildContext context,
    required email,
    required password,
    required name,
    required country,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var userid = FirebaseAuth.instance.currentUser!.uid;
      var db = FirebaseFirestore.instance;

      Map<String, dynamic> data = {
        "name": name,
        "country": country,
        "email": email,
        "id": userid.toString()
      };
      try {
        db.collection("users").doc(userid.toString()).set(data);
      } catch (e) {
        print(e);
      }

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
