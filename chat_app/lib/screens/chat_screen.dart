import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: ListView.builder(itemCount: 10, itemBuilder: (ctx, index) =>
          Container(
            padding: EdgeInsets.all(8),
            child: Text('Ofc this works'),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Firestore.instance.collection('chats/eM5tagy4XmMMStELY2bG/messages')
              .snapshots().listen((data){
                print(data);
          });
        },
      ),);
  }
}
