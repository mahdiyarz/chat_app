import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Screen')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('my chat app'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Firebase.initializeApp();
          FirebaseFirestore.instance
              .collection('chats/3EZTXsmHvM7QEpCiE99b/messages')
              .snapshots()
              .listen((data) {
            data.docs.forEach((element) {
              print(element['text']);
            });
          });
        },
        child: Icon(Icons.message),
      ),
    );
  }
}
