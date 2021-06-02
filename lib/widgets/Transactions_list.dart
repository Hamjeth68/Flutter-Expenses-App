//flutter imports
import 'package:flutter/material.dart';

//model imports
import '../models/transaction.dart';

class TansactionsList extends StatefulWidget {
  const TansactionsList({Key? key}) : super(key: key);

  @override
  _TansactionsListState createState() => _TansactionsListState();
}

class _TansactionsListState extends State<TansactionsList> {
  final List<Transaction> _userTransaction = [
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
    return Container();
  }
}
