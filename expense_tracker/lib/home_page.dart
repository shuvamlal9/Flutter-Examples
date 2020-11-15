import 'package:expense_tracker/transactions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 1, title: "New Shoe", amount: 69.8, date: DateTime.now()),
    Transaction(id: 2, title: "Paint Ball", amount: 78.4, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: transactions.map((transactions) {
          return Card(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(4.0),
                child: Text(transactions.amount.toString()),
                decoration: BoxDecoration(border: Border.all()),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transactions.title, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(transactions.date.toString())
                ],
              )
            ],
          ));
        }).toList(),
      ),
    );
  }
}
