import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revision_transaction_user/models/transactions.dart';
import 'package:revision_transaction_user/widgets/chart.dart';
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
      theme: ThemeData(
        primaryColor: Colors.purple,
        textTheme: TextTheme(button: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  List<Transaction> transactions = [];

  void _addTransaction(String titleTx, double amountTx, DateTime chosenDay) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: titleTx,
        amount: amountTx,
        date: chosenDay);
    setState(() {
      transactions.add(newTransaction);
    });
    Navigator.pop(context);
  }

  void _deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((element) {
        return element.id == id;
      });
    });
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

  List<Transaction> get _userTransaction {
    return transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
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
            Chart(
              userTransaction: _userTransaction,
            ),
            // InputTransaction(addTransation: _addTransaction),
            transactions.isEmpty
                ? Text("No transacions yet !!")
                : ListTransactions(
                    listTransactions: transactions,
                    deleteTx: _deleteTransaction,
                  ),
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
