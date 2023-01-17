import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_training/helpers/return_date.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/my_books/ViewModel/mybook_database.dart';
import 'package:flutter_training/my_books/model/mybook.dart';
import 'package:flutter_training/my_books/widget/linear_progress_bar.dart';
import 'package:flutter_training/user/ViewModel/authentication.dart';
import 'package:flutter_training/user/widgets/rating_widget.dart';
import 'package:provider/provider.dart';

class MyBookCard extends StatelessWidget {
  const MyBookCard({
    Key? key,
    required this.myBook,
    required this.remove,
  }) : super(key: key);
  final MyBook myBook;
  final VoidCallback remove;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Image.network(
          myBook.image!,
          height: 200,
          fit: BoxFit.fitWidth,
        ),
        content: SizedBox(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                myBook.name!,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SH20,
              Row(
                children: [
                  const Text("Rate this book: "),
                  SW5,
                  RatingBar(
                    itemCount: 5,
                    allowHalfRating: true,
                    itemSize: screenWidthPercentage(context, percentage: 0.06),
                    ratingWidget: ratingWidget(),
                    onRatingUpdate: (value) {
                      myBook.rating = value;
                    },
                  )
                ],
              ),
              SH10,
              Row(
                children: [
                  const Text("Your current page: "),
                  SizedBox(
                    width: 50,
                    height: 20,
                    child: TextFormField(
                      maxLength: 5,
                      decoration: const InputDecoration(counterText: ""),
                      onChanged: (value) {
                        myBook.currentPage=int.parse(value);
                        if(myBook.currentPage>myBook.page!) {
                          myBook.currentPage=myBook.page!;
                        }
                      },
                    ),
                  ),
                  Text("/ ${myBook.page}")
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              var auth = Provider.of<Authentication>(context, listen: false);
              MyBookDatabase().updateRatingAndCurrentPage(auth.currUser!.uid!, myBook);
            },
            child: const Text("Close"),
          ),
          TextButton(
            onPressed: remove,
            child: const Text("Return this book"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          border: Border.all(color: Colors.green),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SW12,
            Image.network(
              myBook.image!,
              height: 120,
              fit: BoxFit.fitHeight,
            ),
            SW12,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myBook.name!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SH5,
                Text("Author: ${myBook.author}"),
                SH5,
                Text("Genre: ${myBook.genre}"),
                SH5,
                Row(
                  children: [
                    Text("My rating: ${myBook.rating}"),
                    SW2,
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 15,
                    ),
                  ],
                ),
                SH5,
                LinearProgressBar(value: myBook.currentPage / myBook.page!),
                SH10,
                Text(
                  "Due date: ${ReturnDate.formatDate(myBook.dueDate!)}",
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
