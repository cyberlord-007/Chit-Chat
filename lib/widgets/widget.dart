import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

Widget mainAppBar(BuildContext context) {
  return AppBar(
      title: Center(
          child: Text(
    'Chit Chat',
    style: GoogleFonts.satisfy(fontSize: 25),
  )));
}

InputDecoration textFieldInputDecoration(
    String hintText, String labelText, IconData iconType) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.white30),
    labelText: labelText,
    suffixIcon: Icon(
      iconType,
      color: Colors.lightBlue,
    ),
    labelStyle: TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kLightColor, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}
