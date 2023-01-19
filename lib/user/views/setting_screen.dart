import 'package:flutter/material.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/helpers/default_elevated_button.dart';
import 'package:flutter_training/helpers/return_date.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:flutter_training/user/ViewModel/authentication.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultScaffold(
      context,
      appBar: defaultAppBar(context, "Settings"),
      body: Consumer<Authentication>(
        builder: (context, auth, child) {
          return Container(
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
                        Text("Username: ${auth.currUser!.name}"),
                        Text("Email: ${auth.currUser!.email}"),
                        Text(
                            "Created date: ${ReturnDate.formatDate(auth.currUser!.accountCreated!)}"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RouteName.changeInformation);
                          },
                          child: const Text("Change information"),
                        ),
                      ],
                    ),
                  ),
                ),
                SH10,
                defaultElevatedButton (() async {
                    Authentication auth =
                        Provider.of<Authentication>(context, listen: false);
                    if (await auth.logOut()) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          RouteName.root, (route) => false);
                    }
                  },
                  "Log out", screenWidthPercentage(context, percentage: 0.5),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}