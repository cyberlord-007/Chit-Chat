import 'package:chit_chat/screens/SignUp.dart';
import 'package:flutter/material.dart';
import './screens/LogIn.dart';
import './screens/SignUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LogIn.id,
      routes: {
        LogIn.id: (context) => LogIn(),
        SignUp.id: (context) => SignUp()
      },
    );
  }
}
