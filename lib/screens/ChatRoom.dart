import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRoom extends StatefulWidget {
  static String id = 'chat_room';

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() {

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Welcome'),
    );
  }
}
