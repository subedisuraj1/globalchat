import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/providers/user_providers.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData = {};

  var db = FirebaseFirestore.instance;
  var authuser = FirebaseAuth.instance.currentUser;

  void getData() {
    db.collection("users").doc(authuser!.uid).get().then((dataSnapshot) {
      setState(() {
        userData = dataSnapshot.data();
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Text(userProvider.userName),
          Text(userProvider.userId),
          Text(userProvider.userEmail),
        ],
      ),
    );
  }
}
