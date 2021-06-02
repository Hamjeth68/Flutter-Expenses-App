//flutter imports
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//model imports
import '../models/transaction.dart';

class TansactionsList extends StatefulWidget {
  const TansactionsList({Key? key}) : super(key: key);

  @override
  _TansactionsListState createState() => _TansactionsListState();
}

class _TansactionsListState extends State<TansactionsList> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '01id',
      title: 'Gaming LapTop',
      ammount: 43.12,
      date: DateTime.now(),
      brandName: 'MSI',
    ),
    Transaction(
      id: '02d',
      title: 'Gaming Mouse',
      ammount: 20.7,
      date: DateTime.now(),
      brandName: 'ROG',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map((tx) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  '\$${tx.ammount}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.title.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    tx.brandName.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tx.date),
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
