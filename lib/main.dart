//Flutter imports
import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';

import './widgets/Transactions_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Book',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 25,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

//soon this will change to a StatefulWidget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: '01id',
    //   title: 'Gaming LapTop',
    //   ammount: 43.12,
    //   date: DateTime.now(),
    //   brandName: 'MSI',
    // ),
    // Transaction(
    //   id: '02d',
    //   title: 'Gaming Mouse',
    //   ammount: 20.7,
    //   date: DateTime.now(),
    //   brandName: 'ROG',
    // )
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

//addMthod
  void _addNewTransaction(
      String txTitle, double txAmmount, String txBrand, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      ammount: txAmmount,
      brandName: txBrand,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void deletetransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Expenses Book'),
      actions: <Widget>[
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //the chart
            Container(
                height: (MediaQuery.of(context).size.height * 0.4 -
                    appBar.preferredSize.height),
                child: Chart(_recentTransactions)),
            Container(
                height: (MediaQuery.of(context).size.height * 0.6 -
                    appBar.preferredSize.height),
                child: TansactionsList(_userTransactions, deletetransaction)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
