import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnTheCarts = [
    {
      "name": "black gown",
      "picture": "images/products/dress2.jpeg",
      "price": 50,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "shoes",
      "picture": "images/products/hills2.jpeg",
      "price": 50,
      "size": "7",
      "color": "Red",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsOnTheCarts.length,
      itemBuilder: (context, index) {
        return SingleCartProduct(
          cartProductColor: productsOnTheCarts[index]["color"],
          cartProductPicture: productsOnTheCarts[index]["picture"],
          cartProductName: productsOnTheCarts[index]["name"],
          cartProductQuantity: productsOnTheCarts[index]["quantity"],
          cartProductPrice: productsOnTheCarts[index]["price"],
          cartProductSize: productsOnTheCarts[index]["size"],
        );
      },
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProductName;
  final cartProductPicture;
  final cartProductSize;
  final cartProductPrice;
  final cartProductColor;
  final cartProductQuantity;

  SingleCartProduct(
      {this.cartProductName,
      this.cartProductPicture,
      this.cartProductSize,
      this.cartProductPrice,
      this.cartProductColor,
      this.cartProductQuantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//        =======LEADING SECTION ======
        leading: Image.asset(cartProductPicture, height: 80.0, width: 80.0,),

//        =====TITLE SECTION
        title: Text(cartProductName),
//        SUBTITLE SECTION
        subtitle: Column(
          children: <Widget>[
//            row inside the column
            Row(
              children: <Widget>[
//                this section is for the size of the product
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Size:'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cartProductSize,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
//                This section is for  product colour
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text('Color:'),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cartProductColor,
                      style: TextStyle(color: Colors.red)),
                ),
              ],
            ),

            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '\$$cartProductPrice',
                style: TextStyle(fontSize: 17.0,
                fontWeight: FontWeight.bold, color: Colors.red),
              ),
            )
          ],
        ),
        trailing: Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){},),
            Text('$cartProductQuantity'),
            IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){},),
          ],
        ),
      ),
    );
  }
}
