import 'package:flutter/material.dart';
import 'package:flutter_training/books/widgets/library_body.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/routes/app_routes.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultScaffold(
      context,
      appBar: defaultAppBar(context, "Our library"),
      body: const LibraryBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteName.donate);
        },
        tooltip: "Donate your book to our library here",
        child: const Icon(Icons.add),
      ),
    );
  }
}
