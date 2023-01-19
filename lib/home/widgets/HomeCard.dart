import 'package:flutter/material.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';

Widget homeCard(BuildContext context,
    {required String assets,
    required String title,
    required VoidCallback onPress}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      height: 150,
      width: screenWidthPercentage(context, percentage: 0.9),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/$assets"),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            backgroundColor: Theme.of(context).backgroundColor,
          ),
        ),
      ),
    ),
  );
}
