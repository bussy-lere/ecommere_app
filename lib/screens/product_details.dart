import 'package:flutter/material.dart';
import 'home.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailPicture;
  final productDetailOldPrice;
  final productDetailNewPrice;

  ProductDetails({this.productDetailName, this.productDetailPicture, this.productDetailOldPrice, this.productDetailNewPrice});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
            },
            child: Text('fashapp')),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset("${widget.productDetailPicture}"),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text("${widget.productDetailName}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('\$${widget.productDetailOldPrice}', style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, ),),
                      ),
                      Expanded(
                        child: Text('\$${widget.productDetailNewPrice}', style: TextStyle( fontWeight: FontWeight.bold, color: Colors.red),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          Row(
            children: <Widget>[
              //          the size button ========
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                  showDialog(context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text('Size'),
                      content: Text('Choose the size'),
                      actions: <Widget>[
                        MaterialButton(onPressed: (){
                          Navigator.pop(context);
                        },
                          child: Text('close'),
                        )
                      ],
                    );
                  }
                  );
                },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Size'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                    onPressed: (){
                      showDialog(context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text('Color'),
                              content: Text('Choose a color'),
                              actions: <Widget>[
                                MaterialButton(onPressed: (){
                                  Navigator.pop(context);
                                },
                                  child: Text('close'),
                                )
                              ],
                            );
                          }
                      );
                    },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Color'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),

//              the size button ========
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text('Quantity'),
                            content: Text('Choose the quantity'),
                            actions: <Widget>[
                              MaterialButton(onPressed: (){
                                Navigator.pop(context);
                              },
                                child: Text('close'),
                              )
                            ],
                          );
                        }
                    );
                  },
                color: Colors.white,
                textColor: Colors.grey,
                  elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Qty'),
                    ),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
                ),
              ),
            ],
          ),

      Row(
        children: <Widget>[
          Expanded(
            child: MaterialButton(onPressed: (){},
              color: Colors.red,
              textColor: Colors.white,
              elevation: 0.2,
              child: Text('Buy now')
            ),
          ),

          new IconButton(icon: Icon(Icons.add_shopping_cart),color: Colors.red, onPressed: (){

          },),

          new IconButton(icon: Icon(Icons.favorite_border), color: Colors.red, onPressed: (){

          },),
        ],
      ),
          Divider(),
          ListTile(
            title: Text('Product details'),
            subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(
                12.0, 5.0, 5.0, 5.0
              ),
                child: Text('Product name', style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text(widget.productDetailName),
              )
            ],
          ),
//        Product Brand
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(
                  12.0, 5.0, 5.0, 5.0
              ),
                child: Text('Product brand', style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text('Brand X'),
              )
            ],
          ),
//        Product Condition
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(
                  12.0, 5.0, 5.0, 5.0
              ),
                child: Text('Product condition', style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text('NEW'),
              ),
                ],
          ),

          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Similar products'),
          ),
//        Similar Products section
          Container(
            height: 360.0,
            child: SimilarProducts(),
          ),

      ]
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var productList = [
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
          return SimilarSingleProd(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldPrice: productList[index]['oldPrice'],
            productPrice: productList[index]['price'],
          );
        });
  }
}

class SimilarSingleProd extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productPrice;

  SimilarSingleProd(
      {this.productName,
        this.productPicture,
        this.productOldPrice,
        this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text('hero 1'),
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
          child: GridTile(
            footer: Container(
                color: Colors.white70,
                child: new Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(productName, style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0,
                      ) ,),
                    ),
                    Text('\$$productPrice', style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                )
            ),
            child: Image.asset(
              productPicture,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

