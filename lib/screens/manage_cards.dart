import 'package:flutter/material.dart';
import 'package:flutterecom/models/card.dart';
import 'package:flutterecom/widgets/common.dart';

class ManageCardsScreen extends StatefulWidget {
  @override
  _ManageCardsScreenState createState() => _ManageCardsScreenState();
}

class _ManageCardsScreenState extends State<ManageCardsScreen> {
  List<CardModel> cardsList = [
  CardModel.fromMap({
    'id': 'asdasdas',
    'exp_month': 12,
    'exp_year': 21,
    'last4': 4242,
  }, customerId: 'asdssdasdas'),

    CardModel.fromMap({
      'id': 'asdasdas',
      'exp_month': 8,
      'exp_year': 20,
      'last4': 1657,
    }, customerId: 'asdssdasdas'),

    CardModel.fromMap({
      'id': 'asdasdas',
      'exp_month': 9,
      'exp_year': 22,
      'last4': 9087,
    }, customerId: 'asdssdasdas'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('Manage Cards')),
      body: ListView.builder(
          itemCount: cardsList.length,
          itemBuilder: (_, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: deepOrange,
                          offset: Offset(2, 1),
                          blurRadius: 5

                      )
                    ]
                ),
                child: ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('**** **** **** ${cardsList[index].last4}'),
                  subtitle: Text('${cardsList[index].month} / ${cardsList[index].year}'),
                  trailing: Icon(Icons.more_horiz),
                  onTap: (){

                  },
                ),
              ),
            );
      })
    );
  }
}
