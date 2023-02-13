import 'package:flutter/material.dart';

ElevatedButton defaultElevatedButton(VoidCallback onPress, String text, double buttonWidth) {
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      padding: const EdgeInsets.all(0),
    ),
    child: Ink(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF52DAA),
            Color(0xFF4F2CAA),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(22),
        ),
      ),
      child: SizedBox(
        width: buttonWidth,
        height: 44,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}