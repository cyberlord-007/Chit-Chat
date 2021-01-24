import 'package:chit_chat/screens/ChatRoom.dart';
import 'package:chit_chat/screens/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import '../widgets/widget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUp extends StatefulWidget {
  static String id = 'sign_up';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String username;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: mainAppBar(context),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Spacer(),
                TextField(
                  onChanged: (value) {
                    username = value;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: textFieldInputDecoration(
                      'Username...', 'Username', Icons.person),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration:
                      textFieldInputDecoration('Email...', 'Email', Icons.mail),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: textFieldInputDecoration(
                      'Create a Password...', 'Password', Icons.lock),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Material(
                    elevation: 5.0,
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.pushNamed(context, ChatRoom.id);
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Register',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?? ",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          return Navigator.pushNamed(context, LogIn.id);
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: kPrimaryColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
