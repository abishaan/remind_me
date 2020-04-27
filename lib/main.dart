import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me/models/user.dart';
import 'package:remind_me/screens/authenticate/reset_password.dart';
import 'package:remind_me/screens/authenticate/sign_in.dart';
import 'package:remind_me/screens/authenticate/welcome_page.dart';
import 'package:remind_me/screens/praveen/home.dart';
import 'package:remind_me/screens/wrapper.dart';
import 'package:remind_me/services/auth.dart';
import 'package:remind_me/screens/authenticate/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper1(),
          '/register': (context) => Register(),
          '/home': (context) => Home(),
          '/signin': (context) => SignIn(),
          '/welcome': (context) => Welcome(),
          '/forgotPassword': (context) => ResetPassword(),
//          '/createNotification': (context) => CreateNotificationPage()
        }
    ),
    );
  }
}