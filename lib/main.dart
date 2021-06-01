import 'package:flutter/material.dart';

//my files
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      home: MyHomePage(),
    );
  }
}

//soon this will change to a StatefulWidget
class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart'),
              elevation: 10,
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
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
                          tx.date.toString(),
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
          ),
        ],
      ),
    );
  }
}
