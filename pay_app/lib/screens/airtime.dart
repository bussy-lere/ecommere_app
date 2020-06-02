import 'package:flutter/material.dart';
import 'package:payapp/utilities/constants.dart';

class Airtime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.pop(context);
        },),
        title: Text('Buy Airtime', ),
        backgroundColor: red,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 15 ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Select a network', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text('9Mobile', style: TextStyle(fontSize: 20, color: red),textAlign: TextAlign.center, ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width:0.5)
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text('MTN', style: TextStyle(fontSize: 20, color: red), textAlign: TextAlign.center,),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width:0.5)
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
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text('GLO', style: TextStyle(fontSize: 20, color: red), textAlign: TextAlign.center, ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width:0.5)
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text('AIRTEL', style: TextStyle(fontSize: 20, color: red), textAlign: TextAlign.center, ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width:0.5)
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, ),
              child: Text('Enter Phone Number', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            TextFormField(
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, ),
              child: Text('Enter Amount (NGN)', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            TextFormField(
              textAlign: TextAlign.center,
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
