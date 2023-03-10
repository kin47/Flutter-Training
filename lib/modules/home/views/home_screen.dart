import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/modules/home/widgets/HomeCard.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:flutter_training/modules/user/ViewModel/authentication.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Authentication>(
      builder: (context, auth, child) {
        return defaultScaffold(
          context,
          appBar: appBarWithActions(
            context,
            context.loc.hi(auth.currUser!.name!),
            [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteName.settings);
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: const Home(),
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          homeCard(
            context,
            assets: "my_books.png",
            title: context.loc.myBooks,
            onPress: () {
              Navigator.of(context).pushNamed(RouteName.mybooks);
            },
          ),
          SH30,
          homeCard(
            context,
            assets: "library.png",
            title: context.loc.visitLibrary,
            onPress: () {
              Navigator.of(context).pushNamed(RouteName.library);
            },
          ),
        ],
      ),
    );
  }
}
