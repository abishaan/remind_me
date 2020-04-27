import 'package:flutter/material.dart';
import 'package:remind_me/services/auth.dart';
import 'package:remind_me/widget/local_notification.dart';

class Home extends StatelessWidget {

  final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async{
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LocalNotificationWidget(),
      ),

    );
  }
}
