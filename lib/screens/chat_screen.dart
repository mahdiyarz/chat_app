import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Screen')),
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (ctx, snapshots) => StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chats/3EZTXsmHvM7QEpCiE99b/messages')
              .snapshots(),
          builder:
              (BuildContext ctx, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final documents = streamSnapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(documents[index]['text']),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //     .listen((data) {
          //   data.docs.forEach((element) {
          //     print(element['text']);
          //   });
          // });
        },
        child: Icon(Icons.message),
      ),
    );
  }
}
