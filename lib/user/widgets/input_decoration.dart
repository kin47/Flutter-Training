import 'package:flutter/material.dart';

InputDecoration inputDecoration(String txt, Icon icon) {
  return InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2.0),
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2.0),
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2.0),
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2.0),
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 14),
    focusColor: const Color(0xFF361A79),
    hintText: txt,
    prefixIcon: icon,
  );
}

InputDecoration passwordInputDecoration(String txt, VoidCallback onPress) {
  return InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2.0),
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2.0),
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2.0),
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2.0),
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 14),
    focusColor: const Color(0xFF361A79),
    hintText: txt,
    prefixIcon: const Icon(Icons.lock),
    suffixIcon: IconButton(
      icon: const Icon(Icons.remove_red_eye),
      onPressed: onPress,
    ),
  );
}