import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MD extends StatelessWidget {
  MD(this.message, this.username,this.userImage, this.isMe, {this.key});

  final String username;
  final String message;
  final String userImage;
  final bool isMe;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>[
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.blue : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
                  topLeft: Radius.circular(8),
                  bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(8),
                ),
              ),
              width: 170,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(
                vertical:13,
                horizontal: 8
              ),
              child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      username,
                      style: TextStyle(
                        color: isMe
                            ? Colors.black
                            : Theme.of(context).accentTextTheme.title.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      message,
                      style: TextStyle(
                          color: isMe
                              ? Colors.black
                              : Theme.of(context).accentTextTheme.title.color),
                      textAlign: isMe ? TextAlign.end : TextAlign.start,
                    ),
                  ]),
            ),
          ]),
        Positioned(
            top: -7,
            left:isMe?205:155,
            child: CircleAvatar(
          backgroundImage: NetworkImage(userImage),
        )),
    ],
    overflow: Overflow.visible,);
  }
}
