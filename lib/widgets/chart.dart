import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revision_transaction_user/models/transactions.dart';

class Chart extends StatelessWidget {
  final List<Transaction> userTransaction;
  const Chart({super.key, required this.userTransaction});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalAmount = 0;
      for (var i = 0; i < userTransaction.length; i++) {
        if (userTransaction[i].date.day == weekDay.day &&
            userTransaction[i].date.month == weekDay.month &&
            userTransaction[i].date.year == weekDay.year) {
          totalAmount += userTransaction[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalAmount};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Row(
      children: [
        Text("Hien Luong"),
      ],
    );
  }
}
