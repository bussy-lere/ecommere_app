import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutterecom/components/horizontal_listview.dart';
import 'package:flutterecom/components/products.dart';
import 'package:flutterecom/db/payments.dart';
import 'package:flutterecom/provider/app_provider.dart';
import 'package:flutterecom/provider/payment_provider.dart';
import 'package:flutterecom/provider/user_provider.dart';
import 'package:flutterecom/screens/manage_cards.dart';
import 'package:flutterecom/screens/purchase.dart';
import 'package:flutterecom/widgets/common.dart';
import 'package:provider/provider.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'credit_card.dart';
import 'cart.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color red = Colors.red;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PaymentProvider payment = Provider.of<PaymentProvider>(context);
    AppProvider appProvider = Provider.of<AppProvider>(context);
    final user = Provider.of<UserProvider>(context);
    Widget imageCarousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/w3.jpeg'),
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/m4.png'),
        ],
        autoplay: true,
        dotBgColor: Colors.transparent,
        dotSize: 2.0,
        indicatorBgPadding: 2.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: deepOrange,),
        elevation: 0.1,
        backgroundColor: white,
        title: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[50],
          elevation: 0.0,
          child: ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.search,
                  color:red,
                ),
                onPressed: () {},
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: red,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
              ),
            title: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Find products',
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
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('Home page'),
              leading: Icon(
                Icons.home,
                color: red,
              ),
              onTap: () {
                changeScreen(context, HomePage());
              },
            ),
            ListTile(
              title: Text('Manage Cards'),
              leading: Icon(
                Icons.credit_card,
                color: red,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ManageCardsScreen()));
              },
            ),
            ListTile(
              title: Text('Add Credit Cards'),
              leading: Icon(
                Icons.add,
                color: red,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CreditCardScreen(title: 'Add card')));
              },
            ),
            ListTile(
              title: Text('Subscriptions'),
              leading: Icon(
                Icons.memory,
                color: red,
              ),
              onTap: () async{
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ManageCardsScreen()));
              },
            ),
            ListTile(
              title: Text('Purchase History'),
              leading: Icon(
                Icons.history,
                color: red,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Purchases()));
              },
            ),
            ListTile(
              title: Text('Shopping cart'),
              leading: Icon(
                Icons.shopping_cart,
                color: red,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
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
                user.signOut();
                changeScreen(context, Login());
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Visibility(
            visible: !user.hasStripeId,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  changeScreen(context, CreditCardScreen(title:'Add card',));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Please add your card details', style: TextStyle(color: white, fontSize: 18,),),
                    ],
                  ),
                ),
              ),
            ),),
//          image carousel
          imageCarousel,
//          padding widget
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),

          Text(appProvider.featureProducts.length.toString(), style: TextStyle(color:Colors.black ),),
//          Horizontal list view begins here
          HorizontalList(),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Recent products'),
          ),

//           Grid view
          Flexible(child: Products()),


        ],
      ),
    );
  }
}
