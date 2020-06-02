import 'package:flutter/material.dart';
import 'package:sotrapp/screens/home.dart';
import 'package:sotrapp/utilities/constants.dart';

class Academics extends StatefulWidget {
  @override
  _AcademicsState createState() => _AcademicsState();
}

class _AcademicsState extends State<Academics> {
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
        child: Text('Academics', style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blue,
    ),),
    ),

    Expanded(
    flex: 1,
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
    hintText: 'search',
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
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text('Choose a class', style: TextStyle(
                      fontSize: 15, color: black, fontWeight: FontWeight.bold
                  ) , ),
                ),
                Expanded(
                  child: DropdownButton(
                    dropdownColor: white,
                    autofocus: true,
                    items: [
                      DropdownMenuItem<String>(
                        child:  Text('JSS 1'), value: 'JSS1',
                      ),
                      DropdownMenuItem<String>(
                        child:  Text('JSS 2'), value: 'JSS2',
                      ),
                      DropdownMenuItem<String>(
                        child:  Text('JSS 3'), value: 'JSS3',
                      ),
                      DropdownMenuItem<String>(
                        child:  Text('SSS 1'), value: 'SS1',
                      ),
                      DropdownMenuItem<String>(
                        child:  Text('SSS 2'), value: 'SS2',
                      ),
                      DropdownMenuItem<String>(
                        child:  Text('SSS 3'), value: 'SS3',
                      ),
                    ],
                    onChanged: (String value){
                      setState(() {
                        _value = value;
                      });
                    },
                    hint: Text('JSS2'),
                    value: _value,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(child: BuildDepartment(color: Colors.red[800], department: 'MATHEMATICS',), onTap: (){
                  changeScreen(context, Academics());
                },),
                BuildDepartment(color: Colors.yellow[800], department: 'PHYSICS',),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BuildDepartment(color: Colors.green[800], department: 'CHEMISTRY',),
                BuildDepartment(color: Colors.blue[800], department: 'BIOLOGY',),
              ],
            ),
            SizedBox(height: 20,),
            
          ],
        ),
      ),
    );
  }
}
