// This file is used to re-direct the listener to the sign in page
//resources used to refer:
//1. https://github.com/iamshaunjp/flutter-firebase

import 'package:flutter/material.dart';
import 'package:remind_me/screens/authenticate/register.dart';
import 'package:remind_me/screens/authenticate/reset_password.dart';
import 'package:remind_me/screens/authenticate/sign_in.dart';
import 'package:remind_me/screens/authenticate/welcome_page.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn()
    );
  }
}
