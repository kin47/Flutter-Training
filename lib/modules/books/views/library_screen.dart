import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/modules/books/widgets/library_body.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/routes/app_routes.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultScaffold(
      context,
      appBar: defaultAppBar(context, context.loc.libraryTitle),
      body: const LibraryBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteName.donate);
        },
        tooltip: context.loc.donateTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }
}
