import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  static const NETWORK = 'network';
  static const AMOUNT = 'amount';

  String  _network;
  String  _amount;

//  getters
  String get network => _network;
  String get amount => _amount;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _network = snapshot.data[NETWORK];
    _amount = snapshot.data[AMOUNT];
  }

  UserModel.fromMap(Map data){
    _network =  data[NETWORK];
    _amount = data[AMOUNT];
  }

  Map<String, dynamic> toMap() {
    return {
      NETWORK : _network,
      AMOUNT : _amount,
    };
  }

}





