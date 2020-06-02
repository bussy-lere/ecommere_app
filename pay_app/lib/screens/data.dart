import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payapp/utilities/constants.dart';

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  bool isSelected9Mobile = false;
  bool isSelectedMTN = false;
  bool isSelectedGLO = false;
  bool isSelectedAIRTEL = false;
  String _value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Buy Data',
        ),
        backgroundColor: red,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Select a network',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isSelected9Mobile = !isSelected9Mobile;
                      });
                    },
                    child: InkWell(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            '9Mobile',
                            style: TextStyle(fontSize: 20, color: red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5,
                                color: isSelected9Mobile
                                    ? Colors.red
                                    : Colors.black)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isSelectedMTN = !isSelectedMTN;
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          'MTN',
                          style: TextStyle(fontSize: 20, color: red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5,
                              color:
                                  isSelectedMTN ? Colors.red : Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isSelectedGLO = !isSelectedGLO;
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          'GLO',
                          style: TextStyle(fontSize: 20, color: red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5,
                              color:
                                  isSelectedGLO ? Colors.red : Colors.black)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isSelectedAIRTEL = !isSelectedAIRTEL;
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          'AIRTEL',
                          style: TextStyle(fontSize: 20, color: red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5,
                              color: isSelectedAIRTEL
                                  ? Colors.red
                                  : Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                'Enter Phone Number',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            TextFormField(
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                'Select a data plan',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            DropdownButton(
              items: [
                DropdownMenuItem<String>(
                  child:  Text('Data 32MB(1 day) - NGN 50'), value: '1 day',
                  ),
                DropdownMenuItem<String>(
                  child:  Text('Data 105MB(2 days) - NGN 100'), value: '2 days',
                ),
                DropdownMenuItem<String>(
                  child:  Text('Data 1GB(14 days) - NGN 500'), value: '14 days',
                ),
                DropdownMenuItem<String>(
                  child:  Text('Data 2.5GB(30 days) - NGN 1000'), value: '30 days'
                ),
              ],
              onChanged: (String value){
                setState(() {
                  _value = value;
                });
              },
              hint: Text('Select plan'),
              value: _value,
              dropdownColor: white,
            ),
            SizedBox(height: 20,),
            FlatButton(onPressed: (){

            }, child: Text('Confirm', style: TextStyle(fontWeight: FontWeight.bold),), color: red,)

          ],
        ),
      ),
    );
  }
}
