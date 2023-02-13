import 'package:flutter/material.dart';

Widget defaultScaffold(BuildContext context,
    {AppBar? appBar,
    required Widget body,
    FloatingActionButton? floatingActionButton,
    bool extendBodyBehindAppBar = false}) {
  return Scaffold(
    appBar: appBar,
    backgroundColor: Theme.of(context).backgroundColor,
    body: body,
    floatingActionButton: floatingActionButton,
    extendBodyBehindAppBar: extendBodyBehindAppBar,
  );
}

AppBar defaultAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
    backgroundColor: Theme.of(context).primaryColor,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/assets-01.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
  );
}

AppBar appBarWithActions(
    BuildContext context, String title, List<Widget> actions) {
  return AppBar(
    title: Text(title),
    backgroundColor: Theme.of(context).primaryColor,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/assets-01.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
    actions: actions,
  );
}
