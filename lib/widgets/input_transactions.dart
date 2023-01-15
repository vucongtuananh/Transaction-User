import 'package:flutter/material.dart';

class InputTransactions extends StatefulWidget {
  final Function addTransaction;
  InputTransactions({super.key, required this.addTransaction});

  @override
  State<InputTransactions> createState() => _InputTransactionsState();
}

class _InputTransactionsState extends State<InputTransactions> {
  final costInput = TextEditingController();

  final titleInput = TextEditingController();

  void _onSubmitted() {
    final titleTx = titleInput.text;
    final costTx = double.parse(costInput.text);

    if (titleTx == null || costTx <= 0) {
      return;
    }

    widget.addTransaction(titleTx, costTx);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextField(
                controller: titleInput,
                decoration: const InputDecoration(
                  label: Text("title"),
                ),
                onSubmitted: (_) => _onSubmitted(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: costInput,
                decoration: const InputDecoration(
                  label: Text("cost"),
                ),
                onSubmitted: (_) => _onSubmitted(),
              ),
            ),
            ElevatedButton(
                onPressed: () => widget.addTransaction(
                    titleInput.text, double.parse(costInput.text)),
                child: Text("Add transactions")),
          ],
        ),
      ),
    );
  }
}
