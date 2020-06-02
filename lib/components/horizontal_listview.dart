import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'images/cats/tshirt.png',
            imageCaption: 'shirt',
          ),
          Category(
            imageLocation: 'images/cats/dress.png',
            imageCaption: 'dress',
          ),
          Category(
            imageLocation: 'images/cats/formal.png',
            imageCaption: 'formal',
          ),
          Category(
            imageLocation: 'images/cats/informal.png',
            imageCaption: 'informal',
          ),
          Category(
            imageLocation: 'images/cats/jeans.png',
            imageCaption: 'jeans',
          ),
          Category(
            imageLocation: 'images/cats/shoe.png',
            imageCaption: 'shoe',
          ),
          Category(
            imageLocation: 'images/cats/accessories.png',
            imageCaption: 'accessories',
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({this.imageCaption, this.imageLocation});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2.0),
        child: Container(
          width: 120.0,
          child: InkWell(
            child: ListTile(
              title: Image.asset(imageLocation,
                width: 100.0,
                height: 80.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(imageCaption)),
            ),
          ),
        ),
    );
  }
}
