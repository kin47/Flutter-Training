import 'package:flutter/material.dart';

class ChangeInformationScreen extends StatelessWidget {
  const ChangeInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Delete account",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
