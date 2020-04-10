import 'package:flutter/material.dart';
import '../models/transanction.dart';
import 'package:intl/intl.dart';

class TransanctionList extends StatelessWidget {
  final List<Transanction> transanctions;
  TransanctionList(this.transanctions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child:transanctions.isEmpty?Text('No Transactions Added Yet!'): ListView.builder(
        itemBuilder: (ctx ,i){
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                 
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2.0)),
                  child: Text(
                    '\$${transanctions[i].amount.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(transanctions[i].title),
                    Text(
                      DateFormat('mm/dd/yyy hh:mm:ss:ms').format(transanctions[i].date),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transanctions.length,
      ),
    );
  }
  
}
  
  

