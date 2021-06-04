//flutter imports
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//model imports
import '../models/transaction.dart';

class TansactionsList extends StatelessWidget {
  final List<Transaction> transcactions;

  TansactionsList(this.transcactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${transcactions[index].ammount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transcactions[index].title.toString(),
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                      transcactions[index].brandName.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transcactions[index].date),
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
        },
        itemCount: transcactions.length,
      ),
    );
  }
}
