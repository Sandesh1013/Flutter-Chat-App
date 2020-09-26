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
      body:StreamBuilder(stream:Firestore.instance.collection('chats/eM5tagy4XmMMStELY2bG/messages')
          .snapshots(),builder:(ctx,streamSnapshot){
        if(streamSnapshot.connectionState==ConnectionState.waiting){
          return Center(
            child:CircularProgressIndicator()
          );
        }
        final documents=streamSnapshot.data.documents;
         return ListView.builder(itemCount: streamSnapshot.data.documents.length, itemBuilder: (ctx, index) =>
            Container(
              padding: EdgeInsets.all(8),
              child: Text(documents[index]['text']),
            ));
      }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Firestore.instance.collection('chats/eM5tagy4XmMMStELY2bG/messages').add({
            'text':'This was printed due to clicking the add button!'
          });
        },
      ),);
  }
}
