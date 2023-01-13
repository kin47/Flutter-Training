import 'package:flutter/material.dart';
import 'package:flutter_training/ui_spacing.dart';

class FormBackground extends StatelessWidget {
  const FormBackground({
    Key? key,
    required this.h,
    required this.txt,
  }) : super(key: key);

  final double h;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      width: screenWidthPercentage(context, percentage: 0.95),
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SH16,
          Text(
            txt,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}