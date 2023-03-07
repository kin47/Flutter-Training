import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/modules/books/ViewModel/book_detail_controller.dart';
import 'package:flutter_training/modules/books/model/book.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/helpers/default_elevated_button.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/data/database/mybook_database.dart';
import 'package:flutter_training/modules/user/ViewModel/authentication.dart';
import 'package:provider/provider.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  void _showSuccessDialog(BuildContext context, String message) {
    var snackbar = SnackBar(
      content: Text(message),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      behavior: SnackBarBehavior.floating,
      shape: const StadiumBorder(),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return defaultScaffold(
      context,
      appBar: defaultAppBar(context, book.name!),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              book.image!,
              height: 300,
              width: screenWidth(context),
              fit: BoxFit.fitWidth,
            ),
            SH10,
            Text(
              context.loc.bookInfo,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SH20,
            SizedBox(
              width: screenWidthPercentage(context, percentage: 0.95),
              child: Card(
                elevation: 10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("${context.loc.bookName}: ${book.name}"),
                      SH5,
                      Text("${context.loc.author}: ${book.author}"),
                      SH5,
                      Text("${context.loc.genre}: ${book.genre}"),
                      SH5,
                      Text("${context.loc.publishDate}: ${book.publishYear}"),
                      SH5,
                      Text("${context.loc.numberOfPages}: ${book.page}"),
                      SH5,
                      Text("${context.loc.description}: ${book.description}"),
                    ],
                  ),
                ),
              ),
            ),
            SH20,
            Consumer<BookDetailController>(builder: (context, controller, child) {
              return defaultElevatedButton(
                onPress: () async {
                  controller.onBorrow();
                  var auth =
                      Provider.of<Authentication>(context, listen: false);
                  if (await MyBookDatabase()
                      .borrowedBooks(auth.currUser!.uid!, book)) {
                    controller.onDone();
                    _showSuccessDialog(context, context.loc.borrowSuccess);
                  } else {
                    print("Loi khong muon duoc sach (book_detail_screen)");
                  }
                },
                text: context.loc.borrowBook,
                buttonWidth: screenWidthPercentage(context, percentage: 0.5),
              );
            }),
          ],
        ),
      ),
    );
  }
}
