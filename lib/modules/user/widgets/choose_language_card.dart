import 'package:flutter/material.dart';
import 'package:flutter_training/data/database/user_database.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/main.dart';
import 'package:flutter_training/modules/user/ViewModel/authentication.dart';
import 'package:provider/provider.dart';

class ChooseLanguageCard extends StatefulWidget {
  const ChooseLanguageCard({Key? key}) : super(key: key);

  @override
  State<ChooseLanguageCard> createState() => _ChooseLanguageCardState();
}

class _ChooseLanguageCardState extends State<ChooseLanguageCard> {
  late String language;

  @override
  void initState() {
    language = MyApp.getLocale(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          chooseLanguageEN(context),
          const Divider(
            color: Colors.black,
            height: 0,
          ),
          chooseLanguageVN(context),
        ],
      ),
    );
  }

  Widget chooseLanguageEN(BuildContext context) {
    Authentication auth = Provider.of<Authentication>(context, listen: false);
    return GestureDetector(
      onTap: () {
        MyApp.setLocale(context, const Locale('en', 'US'));
        setState(() {
          language = 'en';
          UserDatabase().changeLanguage(auth.currUser!.uid!, language);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/en.png'),
                  width: 25,
                ),
                SW14,
                Text(
                  context.loc.lang_en,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          language == 'en'
              ? Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Theme.of(context).primaryColor,
                    ),
                    SW16
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget chooseLanguageVN(BuildContext context) {
    Authentication auth = Provider.of<Authentication>(context, listen: false);
    return GestureDetector(
      onTap: () {
        MyApp.setLocale(context, const Locale('vi', 'VN'));
        setState(() {
          language = 'vi';
          UserDatabase().changeLanguage(auth.currUser!.uid!, language);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/vn.png'),
                  width: 25,
                ),
                SW14,
                Text(
                  context.loc.lang_vn,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          language == 'en'
              ? Container()
              : Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Theme.of(context).primaryColor,
                    ),
                    SW16
                  ],
                ),
        ],
      ),
    );
  }
}
