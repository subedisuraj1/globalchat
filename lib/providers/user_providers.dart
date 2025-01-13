import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String userName = "dummy name";
  String userEmail = "dummy user";
  String userId = "dummy id";

  var db = FirebaseFirestore.instance;
  var authuser = FirebaseAuth.instance.currentUser;

  void getUserDetails() {
    db.collection("users").doc(authuser!.uid).get().then((dataSnapshot) {
      userName = dataSnapshot.data()?["name"] ?? "";
      userEmail = dataSnapshot.data()?["email"] ?? "";
      userId = dataSnapshot.data()?["id"] ?? "";
      notifyListeners();
    });
  }
}
