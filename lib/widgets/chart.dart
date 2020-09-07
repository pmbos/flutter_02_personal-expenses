import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  bool _checkDatesEqual(DateTime dt1, DateTime dt2) {
    return dt1.day == dt2.day && dt1.month == dt2.month && dt1.year == dt2.year;
  }

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var transaction in recentTransactions) {
        if (_checkDatesEqual(transaction.createdAt, weekday))
          totalSum += transaction.amount;
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'spendings': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues
            .map((e) => Text('${e['day']}: ${e['spendings']}'))
            .toList(),
      ),
    );
  }
}
