import 'package:flutter/material.dart';
import 'package:flutter_training/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hi!"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteName.settings);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("My books"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteName.library);
              },
              child: const Text("Visit the library"),
            ),
          ],
        ),
      ),
    );
  }
}
