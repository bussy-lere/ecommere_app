import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterecom/db/users.dart';
import 'package:flutterecom/models/card.dart';
import 'package:flutterecom/models/purchase.dart';
import 'package:flutterecom/models/user.dart';
import 'package:flutterecom/services/cards.dart';
import 'package:flutterecom/services/purchases.dart';

enum Status{Uninitialized, Authenticated, Authenticating, Unauthenticated}

class UserProvider with ChangeNotifier{
  FirebaseAuth _auth;
  FirebaseUser  _user;
  Status _status = Status.Uninitialized;
  Status get status => _status;
  FirebaseUser get user => _user;
  UserServices _userServices = UserServices();
  CardServices _cardServices  = CardServices();
  PurchaseServices _purchaseServices = PurchaseServices();

  UserModel _userModel;
  List<CardModel> cards = [];
  List<PurchaseModel> purchaseHistory = [];

  //  we will make this variables public for now
  final formKey = GlobalKey<FormState>();
//  getter
  UserModel get userModel => _userModel;
  bool hasStripeId = true;

  UserProvider.initialize(): _auth = FirebaseAuth.instance{
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<bool> signIn(String email, String password) async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }catch(e){
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  void hasCard(){
    hasStripeId = !hasStripeId;
    notifyListeners();
  }

  Future<void> loadCardsAndPurchase({String userId})async{
    cards = await _cardServices.getCards(userId: userId);
    purchaseHistory = await _purchaseServices.getPurchaseHistory(userId: userId);
  }

  Future<bool> signUp(String name, String email, String password) async{
    print('I am here now');
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then
        ((user) {
        print('I am here now 222');
        Map<String, dynamic> values = {
            'name': name,
            'email': email,
            'userId': user.user.uid
          };
          print('############################################################# Values = $values');
          _userServices.createUser(values);
      }
          );

        return true;
      } catch(e){
      _status = Status.Unauthenticated;
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onStateChanged(FirebaseUser user) async {
    if(user == null){
      _status = Status.Unauthenticated;
    }else{
      _user = user;
      _status = Status.Authenticated;
      _userModel = await UserServices().getUserById(user.uid);
      cards = await _cardServices.getCards(userId: user.uid);
      purchaseHistory = await _purchaseServices.getPurchaseHistory(userId: user.uid);
//      print _userModel.
      if(_userModel.stripeId == null){
        hasStripeId = false;
        notifyListeners();
      }
      print(_userModel.name);
      print(_userModel.email);
      print(_userModel.stripeId);

    }
    notifyListeners();
  }
}