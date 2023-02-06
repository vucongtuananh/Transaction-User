import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revision_transaction_user/models/transactions.dart';
import 'package:revision_transaction_user/widgets/input_transactions.dart';
import 'package:revision_transaction_user/widgets/list_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transactions App',
      home: MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  List<Transaction> transactions = [
    Transaction(
        id: DateTime.now().toString(),
        title: 'pen',
        amount: 9.99,
        date: DateTime.now()),
  ];

  void _addTransaction(String titleTx, double amountTx) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: titleTx,
        amount: amountTx,
        date: DateTime.now());
    setState(() {
      transactions.add(newTransaction);
    });
    Navigator.pop(context);
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: InputTransaction(addTransation: _addTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions User"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text("Chart"),
            InputTransaction(addTransation: _addTransaction),
            ListTransactions(listTransactions: transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
