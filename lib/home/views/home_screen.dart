import 'package:flutter/material.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:flutter_training/user/ViewModel/authentication.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Authentication>(
      builder: (context, auth, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Hi ${auth.currUser!.name}"),
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
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteName.mybooks);
                  },
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
      },
    );
  }
}
