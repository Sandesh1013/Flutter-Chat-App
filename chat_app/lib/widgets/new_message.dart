import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var enteredMessage = '';
  var _controller = new TextEditingController();

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    final userData =
    await Firestore.instance.collection('users').document(user.uid).get();
    Firestore.instance.collection('chat').add({
      'text': enteredMessage,
      'ts': Timestamp.now(),
      'sender': user.uid,
      'username': userData['username']
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Write a message!'),
              onChanged: (value) {
                enteredMessage=value;
                print('message added');
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: enteredMessage.trim().isEmpty?null:
            _sendMessage,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
