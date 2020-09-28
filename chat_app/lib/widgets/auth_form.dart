import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 12),
                    RaisedButton(
                      onPressed: () {},
                      child:Text('Submit'),
                    ),
                    SizedBox(height: 10,),
                    FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        onPressed: (){}, child: Text('Create new Account'))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
