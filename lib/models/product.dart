import 'package:cloud_firestore/cloud_firestore.dart';


class Product{
  static const String BRAND = 'brand';
  static const String CATEGORY = 'category';
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String PICTURE = 'picture';
  static const String PRICE = 'price';
  static const String QUANTITY = 'quantity';
  static const String SIZE = 'size';

  // private variables

  String _brand;
  String _category;
  String _id;
  String _name;
  String _picture;
  double _price;
  int _quantity;
  List<String> _size;

  //  getters
  String get brand => _brand;
  String get category => _category;
  String get id => _id;
  String get name => _name;
  String get picture => _picture;
  double get price => _price;
  int get quantity => _quantity ;
  List<String> get size => _size;

// named constructor
  Product.fromSnapshot(DocumentSnapshot snapshot){
    _brand = snapshot.data[BRAND];
    _category = snapshot.data[CATEGORY];
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _price = snapshot.data[PICTURE];
    _size = snapshot.data[SIZE];
    _quantity = snapshot.data[QUANTITY];
  }

}






