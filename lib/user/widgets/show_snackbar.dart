import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  var snackBar = SnackBar(
    content: Text(message),
    margin: const EdgeInsets.symmetric(horizontal: 20),
    behavior: SnackBarBehavior.floating,
    shape: const StadiumBorder(),
    duration: const Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}