import 'package:flutter/material.dart';


Color white = Colors.white;
Color black = Colors.black;
Color red = Colors.red;
Color grey = Colors.grey;

void changeScreen(BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
