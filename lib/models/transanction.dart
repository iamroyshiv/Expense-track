import 'package:flutter/foundation.dart';

class Transanction {
  String id;
  String title;
  double amount;
  DateTime date;
  Transanction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
