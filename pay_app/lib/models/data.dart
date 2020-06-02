import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  static const EMAIL = 'email';
  static const PASSWORD = 'password';

  String  _email;
  String  _password;

//  getters
  String get email => _email;
  String get password => _password;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _email = snapshot.data[EMAIL];
    _password = snapshot.data[PASSWORD];
  }

  UserModel.fromMap(Map data){
    _email =  data[EMAIL];
    _password = data[PASSWORD];
  }

  Map<String, dynamic> toMap() {
    return {
      EMAIL : _email,
      PASSWORD : _password,
    };
  }

}



