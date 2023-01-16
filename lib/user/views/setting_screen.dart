import 'package:flutter/material.dart';
import 'package:flutter_training/helpers/return_date.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:flutter_training/user/ViewModel/authentication.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Authentication auth = Provider.of<Authentication>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        width: screenWidth(context),
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              width: screenWidth(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Username: ${auth.currentUser!.name}"),
                    Text("Email: ${auth.currentUser!.email}"),
                    Text("Created date: ${ReturnDate.formatDate(auth.currentUser!.accountCreated!)}"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteName.changeInformation);
                      },
                      child: const Text("Change information"),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Authentication auth =
                    Provider.of<Authentication>(context, listen: false);
                if (await auth.logOut()) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteName.root, (route) => false);
                }
              },
              child: const Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
