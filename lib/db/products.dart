import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutterecom/models/product.dart';

class ProductsService{
  Firestore _firestore = Firestore.instance;
  String collection = 'products';

  Future<List<Product>> getProducts() =>
      _firestore.collection(collection).getDocuments().then((result){
        List<Product> productsList = [];
        print('=== RESULT SIZE ${result.documents.length}');
       for(DocumentSnapshot  item in result.documents) {
         productsList.add(Product.fromSnapshot(item));
          print(' PRODUCTSSS ${productsList.length}');
        }

        return productsList;

      });
}