
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterecom/models/user.dart';

class UserServices{
  Firestore _firestore = Firestore.instance;
  String collection = 'users';

  void createUser(Map data){
    _firestore.collection(collection).document(data['userId']).setData(data);
}

  void updateDetails(Map<String, dynamic> values){
    _firestore.collection(collection).document(values['id']).updateData(values);
  }

  Future<UserModel> getUserById( String id)=>
      _firestore.collection(collection).document(id).get().then((doc){
        return UserModel.fromSnapshot(doc);
      });

}
