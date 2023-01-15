import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revision_transaction_user/models/transactions.dart';
import 'package:revision_transaction_user/widgets/input_transactions.dart';
import 'package:revision_transaction_user/widgets/list_transaction.dart';

void main() {
  runApp(MyAppTest());
}

class MyAppTest extends StatelessWidget {
  const MyAppTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        textTheme: const TextTheme(
            headline1: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.blue,
            ),
            subtitle1: TextStyle(color: Colors.grey, fontSize: 11)),
      ),
      home: MyTestHome(),
    );
  }
}

class MyTestHome extends StatefulWidget {
  MyTestHome({super.key});

  @override
  State<MyTestHome> createState() => _MyTestHomeState();
}

class _MyTestHomeState extends State<MyTestHome> {
  final List<Transactions> transactions = [
    Transactions(
        id: DateTime.now().toString(),
        title: 'New shoes',
        date: DateTime.now(),
        cost: 19.99),
  ];

  void _addTransaction(String titleTx, double costTx) {
    final newTx = Transactions(
        id: DateTime.now().toString(),
        title: titleTx,
        date: DateTime.now(),
        cost: costTx);
    setState(() {
      transactions.add(newTx);
    });
  }

  void _showBottomBoard() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () {},
            child: InputTransactions(addTransaction: _addTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revision Transactions'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Card(
              elevation: 5,
              child: Text('Chart'),
            ),
            InputTransactions(
              addTransaction: _addTransaction,
            ),
            ListTransactions(transactions: transactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _showBottomBoard,
        child: Icon(Icons.add),
      ),
    );
  }
}
