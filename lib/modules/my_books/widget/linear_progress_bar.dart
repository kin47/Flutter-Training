import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar({
    Key? key,
    required this.value,
  }) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${context.loc.progress}: "),
        SW5,
        SizedBox(
          width: screenWidthPercentage(context, percentage: 0.3),
          child: LinearProgressIndicator(
            value: value,
            color: Colors.green,
            backgroundColor: Colors.black,
          ),
        ),
        SW5,
        Text("${(value*100.00).toStringAsFixed(2)}%"),
      ],
    );
  }
}
