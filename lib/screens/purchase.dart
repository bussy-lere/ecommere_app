import 'package:flutter/material.dart';
import 'package:flutterecom/models/purchase.dart';
import 'package:flutterecom/provider/user_provider.dart';
import 'package:flutterecom/widgets/common.dart';
import 'package:provider/provider.dart';

class Purchases extends StatefulWidget {
  @override
  _PurchasesState createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  List<PurchaseModel> purchaseList = [
    PurchaseModel.fromMap({
      'id': 'asdasdasd',
      'productName': 'Flutter',
      'amount': 12,
      'date': '12 Jan 2019'
    }),

    PurchaseModel.fromMap({
      'id': 'asdasdasd',
      'productName': 'Flutter',
      'amount': 12,
      'date': '12 Jan 2019'
    }),

    PurchaseModel.fromMap({
      'id': 'asdasdasd',
      'productName': 'Flutter',
      'amount': 12,
      'date': '12 Jan 2019'
    }),

    PurchaseModel.fromMap({
      'id': 'asdasdasd',
      'productName': 'Flutter',
      'amount': 12,
      'date': '12 Jan 2019'
    }),

    PurchaseModel.fromMap({
      'id': 'asdasdasd',
      'productName': 'Flutter',
      'amount': 12,
      'date': '12 Jan 2019'
    })
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.red),
        title: Text(
          "Purchase History",
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: ListView.separated(
          itemCount: purchaseList.length, itemBuilder: (_, index){
        return ListTile(
          leading: Text(
            '\$' + purchaseList[index].amount.toString(),
            style: TextStyle(
                fontSize: 18,
                color: black,
                fontWeight: FontWeight.normal),
          ),
          title: Text(purchaseList[index].productName),
          subtitle: Text("Order id: asdasdasdasd \n Purchased on : ${purchaseList[index].date}"),
          trailing: Icon(Icons.more_horiz),
          onTap: () {},
        );
      },
        separatorBuilder: (BuildContext context, index)  {
            return Divider();
        },
      )
    ,
    );
  }
}
