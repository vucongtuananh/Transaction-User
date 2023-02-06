import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  const ChartBar(
      {super.key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("\$${spendingAmount.toStringAsFixed(0)}"),
        Container(
          width: 10,
          height: 60,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.purple),
            ),
            FractionallySizedBox(
              heightFactor: spendingPctOfTotal,
              child: Container(
                  decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(18),
              )),
            )
          ]),
        ),
        Text(label)
      ],
    );
  }
}
