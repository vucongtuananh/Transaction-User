import 'package:flutter/material.dart';

class InputTransaction extends StatefulWidget {
  Function addTransation;
  InputTransaction({super.key, required this.addTransation});

  @override
  State<InputTransaction> createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  final amountController = TextEditingController();

  final titleController = TextEditingController();

  void submittedData() {
    final inputTitle = titleController.text;
    final inputAmount = double.parse(amountController.text);

    if (inputTitle.isEmpty || inputAmount <= 0) {
      return;
    }
    widget.addTransation(inputTitle, inputAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          decoration: InputDecoration(label: Text("title")),
          controller: titleController,
          onSubmitted: (value) => submittedData(),
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            label: Text("amount"),
          ),
          controller: amountController,
          onSubmitted: (value) => submittedData(),
        ),
        Row(
          children: [
            Text("No Date Chosen !"),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Choose Date",
                  style: TextStyle(color: Colors.purple),
                ))
          ],
        ),
        Container(
            color: Theme.of(context).primaryColor,
            child: TextButton(
                onPressed: submittedData,
                child: Text(
                  "Add Transactions",
                  style: Theme.of(context).textTheme.button,
                ))),
      ],
    );
  }
}
