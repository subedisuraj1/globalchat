import 'package:flutter/material.dart';
import 'package:globalchat/controllers/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var userForm = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: userForm,
          child: Column(
            children: [
              SizedBox(
                child: Image.asset('assets/images/logo.png'),
                height: 100,
                width: 100,
              ),
              TextFormField(
                controller: email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                },
                decoration: InputDecoration(
                  label: Text('Email'),
                ),
              ),
              SizedBox(
                height: 23,
              ),
              TextFormField(
                controller: password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                },
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  label: Text('Password'),
                ),
              ),
              SizedBox(
                height: 23,
              ),
              TextFormField(
                controller: name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                },
                decoration: InputDecoration(
                  label: Text('Name'),
                ),
              ),
              SizedBox(
                height: 23,
              ),
              TextFormField(
                controller: country,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Country is required';
                  }
                },
                decoration: InputDecoration(
                  label: Text('Country'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(0, 50),
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (userForm.currentState!.validate()) {
                          //create account
                          SignupController.createAccount(
                              context: context,
                              email: email.text,
                              password: password.text);
                        }
                      },
                      child: Text('Create account'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
