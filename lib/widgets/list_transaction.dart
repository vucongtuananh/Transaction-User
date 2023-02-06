import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revision_transaction_user/models/transactions.dart';

class ListTransactions extends StatelessWidget {
  final List<Transaction> listTransactions;
  ListTransactions({super.key, required this.listTransactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: listTransactions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                  child: FittedBox(
                      child: Text(
                          "\$${listTransactions[index].amount.toStringAsFixed(2)}"))),
              title: Text(listTransactions[index].title),
              subtitle:
                  Text(DateFormat.E().format(listTransactions[index].date)),
            ),
          );
        });
  }
}
