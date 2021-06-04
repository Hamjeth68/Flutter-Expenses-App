import 'package:flutter/material.dart';

//my files
import './Transactions_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

//addMthod
  void _addNewTransaction(String txTitle, double txAmmount, String txBrand) {
    final newTx = Transaction(
      title: txTitle,
      ammount: txAmmount,
      brandName: txBrand,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TansactionsList(_userTransactions),
      ],
    );
  }
}
