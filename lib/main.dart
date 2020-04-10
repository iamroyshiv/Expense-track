import 'widgets/new_transanction.dart';
import 'package:flutter/material.dart';
import 'models/transanction.dart';
import 'widgets/transanction_list.dart';

void main() {
  runApp(ThisApp());
}

class ThisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.pink,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      title: 'Expenses',
      debugShowCheckedModeBanner: true,
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transanction> _usertransanctions = [
    /*  Transanction(
        id: '121', title: 'Shoes', amount: 99.99, date: DateTime.now()),
    Transanction(
        id: '122', title: 'Groceries', amount: 19.99, date: DateTime.now()),
    Transanction(
        id: '1', title: 'Groceries', amount: 0.99, date: DateTime.now()) */
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transanction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _usertransanctions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return NewTransanction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
        actions: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              startAddNewTransaction(context);
            },
            elevation: 10.0,
            tooltip: 'click',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 5.0,
              child: Container(
                width: double.infinity,
                height: 50.0,
                child: Text(
                  'chart',
                  style: TextStyle(),
                ),
              ),
            ),
            TransanctionList(_usertransanctions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAddNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
