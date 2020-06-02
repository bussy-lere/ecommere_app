import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sotrapp/departments/academics.dart';
import 'package:sotrapp/utilities/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _searchController = TextEditingController();
  String _value;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Row(
          children: <Widget>[
            Expanded(
              child: Text('Home', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: blue,
              ),),
            ),

            Expanded(
              flex: 3,
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[50],
                elevation: 0.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color:blue,
                          ),
                          onPressed: () {},
                        ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'search courses',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'The search field cannot be empty';
                              }
                              return null;
                            }
                        ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: blue,
                ),
                onPressed: () {

                },
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Busayomi Odukoya'),
              accountEmail: Text('bubu@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
            ),
            ListTile(
              title: Text('Home page'),
              leading: Icon(
                Icons.home,
                color: blue,
              ),
              onTap: () {
                changeScreen(context, HomePage());
              },
            ),
            ListTile(
              title: Text('Manage Cards'),
              leading: Icon(
                Icons.credit_card,
                color: blue,
              ),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Add Credit Cards'),
              leading: Icon(
                Icons.add,
                color: blue,
              ),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Subscriptions'),
              leading: Icon(
                Icons.memory,
                color: blue,
              ),
              onTap: () async{

              },
            ),
            ListTile(
              title: Text('Purchase History'),
              leading: Icon(
                Icons.history,
                color: blue,
              ),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Shopping cart'),
              leading: Icon(
                Icons.shopping_cart,
                color: blue,
              ),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(
                Icons.settings,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text('Log out'),
              leading: Icon(
                Icons.transit_enterexit,
                color: Colors.red,
              ),
              onTap: () {

              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Hello,', style: TextStyle(
              fontSize: 15, color: grey
            ) , textAlign: TextAlign.left, ),
            Text('Busayomi', style: TextStyle(
                fontSize: 25, color: black, fontWeight: FontWeight.bold
            ) , ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(child: BuildDepartment(color: Colors.red[800], department: 'ACADEMICS',), onTap: (){
               changeScreen(context, Academics());
                },),
                BuildDepartment(color: Colors.yellow[800], department: 'FASHION',),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BuildDepartment(color: Colors.green[800], department: 'LEADERSHIP',),
                BuildDepartment(color: Colors.blue[800], department: 'LANGUAGES',),
              ],
            ),
            SizedBox(height: 10,),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black87,
              child: MaterialButton(onPressed: null, child: Text(
                'PRACTICE QUESTIONS', style: TextStyle(color: white),
              ),),
            ),
            SizedBox(height: 10,),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.orange[900],
              child: MaterialButton(onPressed: null, child: Text(
                'discuss/ask a question', style: TextStyle(color: white),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildDepartment extends StatelessWidget {
  final Color color;
  final String department;
  BuildDepartment({this.color, this.department}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: color,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text(department, style: TextStyle(fontWeight: FontWeight.bold, color: white, fontSize: 18), textAlign: TextAlign.center, ),
      ),
      height:60,
      width: 180,
    );
  }
}

