import 'package:flutter/material.dart';
import 'package:flutter_training/books/model/book.dart';
import 'package:flutter_training/ui_spacing.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
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
              onPressed: () {},
              child: const Text("Borrow this book"),
            ),
          ],
        ),
      ),
    );
  }
}
