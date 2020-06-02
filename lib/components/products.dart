import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterecom/screens/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "oldPrice": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "oldPrice": 100,
      "price": 50,
    },
    {
      "name": "blazer",
      "picture": "images/products/blazer2.jpeg",
      "oldPrice": 100,
      "price": 80,
    },
    {
      "name": "black gown",
      "picture": "images/products/dress2.jpeg",
      "oldPrice": 90,
      "price": 50,
    },
    {
      "name": "heels",
      "picture": "images/products/hills1.jpeg",
      "oldPrice": 100,
      "price": 50,
    },
    {
      "name": "red heels",
      "picture": "images/products/hills2.jpeg",
      "oldPrice": 100,
      "price": 50,
    },
    {
      "name": "pants",
      "picture": "images/products/pants1.jpg",
      "oldPrice": 100,
      "price": 50,
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "oldPrice": 100,
      "price": 50,
    },
    {
      "name": "skirt",
      "picture": "images/products/skt1.jpeg",
      "oldPrice": 100,
      "price": 50,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldPrice: productList[index]['oldPrice'],
            productPrice: productList[index]['price'],
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productPrice;

  SingleProd(
      {this.productName,
      this.productPicture,
      this.productOldPrice,
      this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(
                      productDetailName: productName,
                      productDetailPicture: productPicture,
                      productDetailOldPrice: productOldPrice,
                      productDetailNewPrice: productPrice,
                    ))),
        child: Material(
          child: InkWell(
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(productName, style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0,
                  ) ,),
                    trailing :Text('\$$productPrice', style: TextStyle(
                      color: Colors.deepOrange, fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),)
                )
              ),
              child: Image.asset(
                productPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
