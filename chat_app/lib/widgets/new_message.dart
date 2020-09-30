import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var enteredMessage='';
  var _controller=new TextEditingController();
  void _sendMessage(){
    FocusScope.of(context).unfocus();
    Firestore.instance.collection('chat').add({
      'text':enteredMessage,
      'ts':Timestamp.now(),
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
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: enteredMessage.trim().isEmpty?null:
            _sendMessage,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
