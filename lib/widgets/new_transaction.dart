//flutter imports
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final ammountController = TextEditingController();
  final brandNameControlller = TextEditingController();
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
    );
  }
}
