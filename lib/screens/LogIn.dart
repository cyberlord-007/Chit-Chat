import 'package:chit_chat/constants.dart';
import 'package:chit_chat/screens/ChatRoom.dart';
import 'package:chit_chat/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:chit_chat/screens/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LogIn extends StatefulWidget {
  static String id = 'log_in';

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
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
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: textFieldInputDecoration(
                      'Enter your email...', 'Email', Icons.mail),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: textFieldInputDecoration(
                      'Type your password...', 'Password', Icons.lock),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
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
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
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
                        'Log In',
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
                        "Don't have an account?? ",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          return Navigator.pushNamed(context, SignUp.id);
                        },
                        child: Text(
                          'Register Now',
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
