import 'package:flutter/material.dart';
import 'package:globalchat/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Text('Don\'t have an account?'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SignupScreen();
                },
              ));
            },
            child: Text('Sign Up now!'),
          ),
        ],
      ),
    );
  }
}
