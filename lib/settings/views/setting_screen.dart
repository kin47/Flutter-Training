import 'package:flutter/material.dart';
import 'package:flutter_training/authenticate/model/authenticate.dart';
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
              Authenticate _auth=Provider.of<Authenticate>(context, listen: false);
              if(await _auth.logOut()) {
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
