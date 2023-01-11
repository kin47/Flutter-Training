import 'package:flutter/material.dart';
import 'package:flutter_training/authentication/ViewModel/authentication.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              Authentication auth=Provider.of<Authentication>(context, listen: false);
              if(await auth.logOut()) {
                Navigator.of(context).pushNamedAndRemoveUntil(RouteName.root, (route) => false);
              }
            },
            child: const Text("Log out"),
          ),
        ],
      ),
    );
  }
}
