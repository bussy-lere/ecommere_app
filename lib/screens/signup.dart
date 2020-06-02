import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterecom/db/users.dart';
import 'package:flutterecom/provider/user_provider.dart';
import 'package:flutterecom/widgets/common.dart';
import 'package:flutterecom/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'package:flutterecom/db/auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  bool loading = false;
  bool hidePassword = true;
  Auth auth = Auth();

  @override
  Widget build(BuildContext context){
  final user = Provider.of<UserProvider>(context);
    return Scaffold(
        key: _key,
      body: user.status == Status.Authenticating? Loading() : Stack(
        children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 120, bottom: 120),
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[350],
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'images/cart.jpg',
                                width: 120.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.withOpacity(0.2),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: ListTile(
                                  title: TextFormField(
                                    controller: _nameTextController,
                                    decoration: InputDecoration(
                                      hintText: 'Full name',
                                      border: InputBorder.none,
                                      icon: Icon(Icons.person_outline),
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'The name field cannot be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
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
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
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
                                  trailing: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: IconButton(
                                      icon: Icon(Icons.remove_red_eye),
                                      onPressed: () {
                                        setState(() {
                                          if (hidePassword) {
                                            hidePassword = false;
                                          } else if (!hidePassword) {
                                            hidePassword = true;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                                borderRadius: BorderRadius.circular(10.0),
                                color: deepOrange,
                                elevation: 0.0,
                                child: MaterialButton(
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      if (!await user.signUp(
                                          _nameTextController.text,
                                          _emailTextController.text,
                                          _passwordTextController.text)
                                      ) {
                                        _key.currentState.showSnackBar(SnackBar( content: Text('Sign up failed !')));
                                        return;
                                      }
                                      changeScreenReplacement(
                                          context, HomePage());
                                    }
                                  },
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: Text(
                                    'Sign up',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                )),
                          ),
                        ),
                        InkWell(
                          child: Text('Sign out', style: TextStyle(color: deepOrange),),
                          onTap: () {
                            user.signOut();
                          },
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'I already have an account',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: deepOrange, fontSize: 16),
                                  ))),
                        ),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Or Sign up with',
                                    style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                                  )),
                              Padding(
                                padding: EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                  child: MaterialButton(
                                    onPressed: ()async {
                                     FirebaseUser user = await auth.googleSignIn();
                                     if(user == null){
                                       _userServices.createUser({
                                         'name': user.displayName,
                                         'photo': user.photoUrl,
                                         'email': user.email,
                                         'userId': user.uid,
                                       });
                                        changeScreenReplacement(context, HomePage());
                                     }
                                    },
                                    child: Image.asset(
                                      'images/ggg.png',
                                      width: 60,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                color: Colors.white.withOpacity(0.8),
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
