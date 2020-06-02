import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payapp/screens/airtime.dart';
import 'package:payapp/screens/login.dart';
import 'package:payapp/utilities/constants.dart';

import 'data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: red,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                  onTap: () {
                    changeScreen(context, HomePage());
                  },
                  leading: Icon(Icons.home),
                  title: Text(
                    'Home',
                    style: TextStyle(fontSize: 18),
                  )),
              ListTile(
                onTap: () {
                  changeScreen(context, Airtime());
                },
                leading: Icon(Icons.phone_in_talk),
                title: Text(
                  'Airtime',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {
                  changeScreen(context, Data());
                },
                leading: Icon(Icons.data_usage),
                title: Text(
                  'Data',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {
                  changeScreen(context, Login());
                },
                leading: Icon(Icons.subdirectory_arrow_right),
                title: Text(
                  'Sign out',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'ODUKOYA BUSAYOMI',
                            style: TextStyle(color: black),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'NGN 20,000.00',
                            style: TextStyle(color: black, fontSize: 25),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            'AccountID:  ***1237',
                            style: TextStyle(color: black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Mobile Top-up',
                      style: TextStyle(color: red, fontSize: 30),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: InkWell(
                                child: Text(
                                  'Airtime',
                                  style: TextStyle(color: white, fontSize: 40),
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () {
                                  changeScreen(context, Airtime());
                                },
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: red,
                              ),
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: InkWell(
                                child: Text(
                                  'Data',
                                  style: TextStyle(color: white, fontSize: 40),
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () {
                                  changeScreen(context, Data());
                                },
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: red,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
