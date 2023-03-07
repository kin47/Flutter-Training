import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/modules/books/model/book.dart';
import 'package:flutter_training/modules/books/views/book_detail_screen.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(book: book),
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
            FadeInImage(
              placeholder: const AssetImage("assets/images/icon.png"),
              image: NetworkImage(book.image!),
              height: 90,
              width: 60,
              fit: BoxFit.cover,
            ),
            SW12,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.name!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SH5,
                Text(
                  "${context.loc.author}: ${book.author}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "${context.loc.genre}: ${book.genre}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
