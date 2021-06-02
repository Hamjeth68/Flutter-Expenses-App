//Flutter imports
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//my files
import 'models/transaction.dart';

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
  final List<Transaction> transactions = [];

  //Controller properties
  final titleController = TextEditingController();
  final ammountController = TextEditingController();
  final brandNameControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //the chart
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    autocorrect: true,
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    //onChanged: (val) {
                    //titleInput = val;
                    //},
                  ),
                  TextField(
                    autocorrect: true,
                    decoration: InputDecoration(labelText: 'Ammount'),
                    controller: ammountController,
                    //onChanged: (val) => ammountInput = val,
                  ),
                  TextField(
                    autocorrect: true,
                    decoration: InputDecoration(labelText: 'Brand Name'),
                    controller: brandNameControlller,
                    //onChanged: (val) => brandInput = val,
                  ),
                  FlatButton(
                    onPressed: () {
                      print(titleController.text);
                      print(ammountController.text);
                      print(brandNameControlller.text);
                    },
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                  ),
                ],
              ),
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
          ),
        ],
      ),
    );
  }
}
