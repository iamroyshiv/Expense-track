import 'package:flutter/material.dart';

class NewTransanction extends StatefulWidget {
  final Function addTx;

  NewTransanction(this.addTx);

  @override
  _NewTransanctionState createState() => _NewTransanctionState();
}

class _NewTransanctionState extends State<NewTransanction> {
  final titleInput = TextEditingController();

  final amountInput = TextEditingController();

  void submitData() {
    final title = titleInput.text;
    final amount = double.parse(amountInput.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.addTx(
      titleInput.text,
      double.parse(amountInput.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(top:10.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text('New Transcation',style: TextStyle(fontSize: 30.0,color: Colors.amber,fontWeight: FontWeight.bold),),
            SizedBox(height: 25.0,),
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                icon: Icon(Icons.title),
                focusColor: Colors.red,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              controller: titleInput,
              onSubmitted: (_) {
                submitData();
              },
            ),
            SizedBox(height: 10.0,),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                
                icon: Icon(Icons.payment),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              controller: amountInput,
              onSubmitted: (_) {
                submitData();
              },
              keyboardType: TextInputType.number,
            ),
            Center(
              heightFactor: 1.50,
              child: FlatButton(
                padding: EdgeInsets.all(20.0),
                child: Text('Submit'),
                 
                onPressed: submitData,
                color: Colors.amber.shade600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
