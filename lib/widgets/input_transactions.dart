import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputTransaction extends StatefulWidget {
  Function addTransation;
  InputTransaction({super.key, required this.addTransation});

  @override
  State<InputTransaction> createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  final amountController = TextEditingController();

  final titleController = TextEditingController();

  DateTime? selectedDate;

  void submittedData() {
    final inputTitle = titleController.text;
    final inputAmount = double.parse(amountController.text);
    if (amountController.text.isEmpty) {
      return;
    }
    if (inputTitle.isEmpty || inputAmount <= 0 || selectedDate == null) {
      return;
    }
    widget.addTransation(inputTitle, inputAmount, selectedDate);
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        selectedDate = pickedDate;
      });
    });
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
            Text(selectedDate == null
                ? "No Date Chosen !"
                : DateFormat('dd-MM-yyyy').format(selectedDate!)),
            TextButton(
                onPressed: _presentDatePicker,
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
