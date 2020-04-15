import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Icon icon;
  Button({this.text,this.icon});
  @override
  Widget build(BuildContext context) {
    return  FlatButton.icon(
      color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.transparent)),
        onPressed: (){}, icon: icon, label: Text('$text'));
  }
}
