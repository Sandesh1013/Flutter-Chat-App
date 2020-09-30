import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor, border: Border.all(color: Colors.white, width: 2.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSvwN3Vd48KHkaScpcZvJnSNEE8slCoCa5RJw&usqp=CAU"),
              radius: 40.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Contact Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
                ),
                Text(
                  "Contact Status",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
