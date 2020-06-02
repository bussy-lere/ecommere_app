import 'package:flutter/material.dart';


Color white = Colors.white;
Color black = Colors.black;
Color red = Colors.red;
Color blue = Colors.blue;
Color grey = Colors.grey;
Color indigo = Colors.indigo;

void changeScreen(BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
