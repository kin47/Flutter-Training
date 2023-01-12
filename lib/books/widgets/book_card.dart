import 'package:flutter/material.dart';
import 'package:flutter_training/books/model/book.dart';
import 'package:flutter_training/books/views/book_detail_screen.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:flutter_training/ui_spacing.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.thisBook,
  }) : super(key: key);

  final Book thisBook;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetail(thisBook: thisBook),
          ),
        );
      },
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.amber,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SW12,
            Image.network(
              thisBook.image!,
              height: 90,
              fit: BoxFit.fitHeight,
            ),
            SW12,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  thisBook.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SH5,
                Text(
                  "Author: ${thisBook.author}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Genre: ${thisBook.genre}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
