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
      height: 500,
      child: transcactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transaction added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png'),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transcactions[index].ammount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transcactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transcactions[index].date),
                    ),
                  ),
                );
              },
              itemCount: transcactions.length,
            ),
    );
  }
}
