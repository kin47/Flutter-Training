import 'package:flutter/material.dart';
import 'package:flutter_training/books/model/book.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/my_books/ViewModel/mybook_database.dart';
import 'package:flutter_training/user/ViewModel/authentication.dart';
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
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name!),
      ),
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
            const Text(
              "Information about this book:",
              style: TextStyle(
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
                      Text("Name: ${book.name}"),
                      SH5,
                      Text("Author: ${book.author}"),
                      SH5,
                      Text("Genre: ${book.genre}"),
                      SH5,
                      Text("Published date: ${book.publishYear}"),
                      SH5,
                      Text("Number of pages: ${book.page}"),
                      SH5,
                      Text("Description: ${book.description}"),
                    ],
                  ),
                ),
              ),
            ),
            SH20,
            ElevatedButton(
              onPressed: () async {
                var auth= Provider.of<Authentication>(context, listen: false);
                if(await MyBookDatabase().borrowedBooks(auth.currUser!.uid!, book)){
                  _showSuccessDialog(context, "Borrowed books successfully");
                }
                else {
                  print("Loi khong muon duoc sach (book_detail_screen)");
                }
              },
              child: const Text("Borrow this book"),
            ),
          ],
        ),
      ),
    );
  }
}
