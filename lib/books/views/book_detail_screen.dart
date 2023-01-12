import 'package:flutter/material.dart';
import 'package:flutter_training/books/model/book.dart';
import 'package:flutter_training/books/widgets/book_card.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({
    Key? key,
    required this.thisBook,
  }) : super(key: key);

  final Book thisBook;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(thisBook.name),
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
