import 'package:flutter/material.dart';
import 'package:sotrapp/screens/sign_up.dart';
import 'package:sotrapp/utilities/constants.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _passwordTextController = TextEditingController();

  TextEditingController _emailTextController = TextEditingController();

  bool hidePassword = false;
  String accountId = '5e329d527567300017b071ae';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: ()  async{
            
                  },
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: white,
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
                child: InkWell(child: Text('Forgot password', textAlign: TextAlign.center, style: TextStyle(color: black,),), onTap:() async{

                  print('DONE ######################### REGISTER ID IS:');

                },),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      changeScreen(context, SignUp());
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
        ],
      ) ,
    );
  }
}
