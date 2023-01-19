import 'package:flutter/material.dart';

void customShowDialog(BuildContext context, VoidCallback onPress, String title,
    String textButton) {
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

void twoOptionsDialog(
    BuildContext context,
    VoidCallback onPress1,
    VoidCallback onPress2,
    String title,
    String textButton1,
    String textButton2) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      actions: <Widget>[
        TextButton(
          onPressed: onPress1,
          child: Text(textButton1),
        ),
        TextButton(
          onPressed: onPress2,
          child: Text(textButton2),
        ),
      ],
    ),
  );
}
