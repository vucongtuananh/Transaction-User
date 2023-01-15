import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revision_transaction_user/models/transactions.dart';

class ListTransactions extends StatelessWidget {
  final List<Transactions> transactions;
  const ListTransactions({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                  child:
                      FittedBox(child: Text("\$${transactions[index].cost}"))),
              title: Text(
                transactions[index].title,
                style: Theme.of(context).textTheme.headline1,
              ),
              subtitle: Text(
                DateFormat('dd-MM-yyyy').format(transactions[index].date),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ));
      },
    );
  }
}
