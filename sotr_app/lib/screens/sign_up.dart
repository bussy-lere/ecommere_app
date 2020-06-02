import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sotrapp/utilities/constants.dart';
import 'home.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _passwordTextController = TextEditingController();

  TextEditingController _emailTextController = TextEditingController();

  bool hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              color: grey.withOpacity(0.2),
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
                      icon: Icon(Icons.lock_outline, color: grey,),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: red,
                elevation: 0.0,
                child: MaterialButton(
                  onPressed: ()  {
                    changeScreen(context, HomePage());
                  },
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
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'I already have an account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: red, fontSize: 16),
                  ))),
        ],
      ) ,
    );
  }
}
