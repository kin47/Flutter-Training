import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/modules/my_books/ViewModel/my_books_controller.dart';
import 'package:flutter_training/modules/my_books/widget/my_book_card.dart';
import 'package:provider/provider.dart';

class MyBooksScreen extends StatelessWidget {
  const MyBooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultScaffold(
      context,
      appBar: defaultAppBar(context, context.loc.myBookTitle),
      body: Consumer<MyBooksController>(
        builder: (ctx, controller, child) {
          controller.getListBorrowedBookData(context);
          return controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return MyBookCard(
                        myBook: controller.listBorrowedBooks[index]);
                  },
                  itemCount: controller.listBorrowedBooks.length,
                );
        },
      ),
    );
  }
}
