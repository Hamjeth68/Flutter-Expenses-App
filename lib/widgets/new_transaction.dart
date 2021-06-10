//flutter imports
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _ammountController = TextEditingController();
  final _brandNameControlller = TextEditingController();
  //Null Check
  DateTime? _selectedDate;

  void _submitData() {
    if (_ammountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmmount = double.parse(_ammountController.text);
    final enteredBrandName = _brandNameControlller.text;

    if (enteredTitle.isEmpty && enteredAmmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmmount,
      enteredBrandName,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDateTimePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData,
              //onChanged: (val) {
              //titleInput = val;
              //},
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Ammount'),
              controller: _ammountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
              //onChanged: (val) => ammountInput = val,
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Brand Name'),
              controller: _brandNameControlller,
              onSubmitted: (_) => _submitData,
              //onChanged: (val) => brandInput = val,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: FlatButton(
                      onPressed: _presentDateTimePicker,
                      child: Text(
                        'Chose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitData,
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button!.color,
            ),
          ],
        ),
      ),
    );
  }
}
