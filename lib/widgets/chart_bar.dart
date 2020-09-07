import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendings;
  final double percentageOfTotalSpendings;

  ChartBar(this.label, this.spendings, this.percentageOfTotalSpendings);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$${spendings.toStringAsFixed(2)}'),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: null,
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
