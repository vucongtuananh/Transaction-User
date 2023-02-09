import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revision_transaction_user/models/transactions.dart';

class ListTransactions extends StatelessWidget {
  final List<Transaction> listTransactions;
  final Function deleteTx;
  ListTransactions(
      {super.key, required this.listTransactions, required this.deleteTx});

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
                  Text(DateFormat.yMMMd().format(listTransactions[index].date)),
              trailing: IconButton(
                  onPressed: () => deleteTx(listTransactions[index].id),
                  icon: const Icon(Icons.delete)),
            ),
          );
        });
  }
}
