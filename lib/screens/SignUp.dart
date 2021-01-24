import 'package:chit_chat/screens/LogIn.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/widget.dart';

class SignUp extends StatefulWidget {
  static String id = 'sign_up';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: mainAppBar(context),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Spacer(),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: textFieldInputDecoration(
                    'Username...', 'Username', Icons.person),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration:
                    textFieldInputDecoration('Email...', 'Email', Icons.mail),
              ),
              SizedBox(height: 20),
              TextField(
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
    );
  }
}
