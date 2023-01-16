import 'package:flutter/material.dart';

void customShowDialog(BuildContext context, VoidCallback onPress, String title, String textButton) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      actions: <Widget>[
        TextButton(
          onPressed: onPress,
          child: Text(textButton),
        ),
      ],
    ),
  );
}