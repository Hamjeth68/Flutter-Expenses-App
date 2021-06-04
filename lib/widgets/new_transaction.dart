//flutter imports
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final ammountController = TextEditingController();

  final brandNameControlller = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmmount = double.parse(ammountController.text);
    final enteredBrandName = brandNameControlller.text;

    if (enteredTitle.isEmpty || enteredAmmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmmount,
      enteredBrandName,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData,
              //onChanged: (val) {
              //titleInput = val;
              //},
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Ammount'),
              controller: ammountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
              //onChanged: (val) => ammountInput = val,
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Brand Name'),
              controller: brandNameControlller,
              onSubmitted: (_) => submitData,
              //onChanged: (val) => brandInput = val,
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
