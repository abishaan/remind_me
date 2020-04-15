import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me/models/user.dart';
import 'package:remind_me/screens/authenticate/authenticate.dart';
import 'package:remind_me/screens/authenticate/sign_in.dart';
import 'package:remind_me/screens/praveen/home.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //return home or authentication
    if (user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
