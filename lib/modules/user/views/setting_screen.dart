import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/helpers/default_elevated_button.dart';
import 'package:flutter_training/extensions/return_date.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/modules/user/widgets/choose_language_card.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:flutter_training/modules/user/ViewModel/authentication.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultScaffold(
      context,
      appBar: defaultAppBar(context, context.loc.settingsTitle),
      body: Consumer<Authentication>(
        builder: (context, auth, child) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: screenWidth(context),
              child: Column(
                children: [
                  infoCard(context, auth),
                  SH10,
                  const ChooseLanguageCard(),
                  SH10,
                  defaultElevatedButton(
                    onPress: () async {
                      Authentication auth =
                          Provider.of<Authentication>(context, listen: false);
                      if (await auth.logOut()) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteName.root, (route) => false);
                      }
                    },
                    text: context.loc.logOut,
                    buttonWidth:
                        screenWidthPercentage(context, percentage: 0.5),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Card infoCard(BuildContext context, Authentication auth) {
    return Card(
      child: SizedBox(
        width: screenWidth(context),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${context.loc.username}: ${auth.currUser!.name}"),
              Text("${context.loc.email}: ${auth.currUser!.email}"),
              Text(
                  "${context.loc.createDate}: ${ReturnDate.formatDate(auth.currUser!.accountCreated!)}"),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteName.changeInformation);
                },
                child: Text(context.loc.changeInfo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
