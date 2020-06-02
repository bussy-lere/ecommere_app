
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterecom/widgets/common.dart';
import 'package:flutterecom/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'signup.dart';
import 'package:flutterecom/provider/user_provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();


  bool loading = false;
  bool hidePassword = true;


  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating? Loading() : Stack(
        children: <Widget>[
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[350],
                        blurRadius: 20.0,
                      )
                    ]
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'images/cart.jpg',
                                width: 120.0,
                              ),
                            ),
                          ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _emailTextController,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    border: InputBorder.none,
                                    icon: Icon(Icons.email),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Please make sure your email address is valid';
                                      else
                                        return null;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _passwordTextController,
                                  obscureText: hidePassword ? true : false,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: InputBorder.none,
                                    icon: Icon(Icons.lock_outline),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'The password field cannot be empty';
                                    } else if (value.length < 6) {
                                      return 'the password has to be at least 6 characters long';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: deepOrange,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
//                                    if (!
                                    await user.signIn(
                                        _emailTextController.text,
                                        _passwordTextController.text);
//    {
//                                      _key.currentState.showSnackBar(SnackBar(
//                                          content: Text('Sign in failed !')));
//                                      return;
//                                    }
                                    changeScreenReplacement(
                                        context, HomePage());
                                  }
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Forgot password', textAlign: TextAlign.center, style: TextStyle(color: black,),),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Text(
                                    'Create an account',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.grey, fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        ),



                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Or',
                                    style:
                                        TextStyle(fontSize: 20, color: Colors.grey),
                                  )),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                              child: Material(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                    'images/fb.png',
                                    width: 60,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                              child: Material(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                    'images/ggg.png',
                                    width: 60,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                color: Colors.grey.withOpacity(0.4),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}


