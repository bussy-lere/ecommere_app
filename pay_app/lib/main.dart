import 'package:flutter/material.dart';
import 'package:payapp/screens/home.dart';
import 'package:payapp/screens/login.dart';
import 'package:payapp/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}

