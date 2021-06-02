//flutter imports
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final ammountController = TextEditingController();
  final brandNameControlller = TextEditingController();

  NewTransaction(this.addTx);

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
              onPressed: () => {
                addTx(
                    titleController.text,
                    double.parse(ammountController.text),
                    brandNameControlller.text)
              },
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
