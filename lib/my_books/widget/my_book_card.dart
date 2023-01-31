import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_training/helpers/num_parse_extension.dart';
import 'package:flutter_training/helpers/return_date.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/my_books/ViewModel/mybook_database.dart';
import 'package:flutter_training/my_books/model/mybook.dart';
import 'package:flutter_training/my_books/widget/linear_progress_bar.dart';
import 'package:flutter_training/user/ViewModel/authentication.dart';
import 'package:flutter_training/user/widgets/rating_widget.dart';
import 'package:provider/provider.dart';

class MyBookCard extends StatefulWidget {
  const MyBookCard({
    Key? key,
    required this.myBook,
  }) : super(key: key);
  final MyBook myBook;

  @override
  State<MyBookCard> createState() => _MyBookCardState();
}

class _MyBookCardState extends State<MyBookCard> {
  bool isRemoved = false;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Image.network(
          widget.myBook.image!,
          height: 200,
          fit: BoxFit.fitWidth,
        ),
        content: SizedBox(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.myBook.name!,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SH10,
              rateBook(context),
              SH10,
              myCurrentPage(),
            ],
          ),
        ),
        actions: actions(context),
      ),
    );
  }

  List<Widget> actions(BuildContext context) {
    return <Widget>[
      TextButton(
        onPressed: () async {
          Navigator.of(context).pop();
          var auth = Provider.of<Authentication>(context, listen: false);
          MyBookDatabase()
              .updateRatingAndCurrentPage(auth.currUser!.uid!, widget.myBook);
        },
        child: const Text("Close"),
      ),
      TextButton(
        onPressed: () {
          var auth = Provider.of<Authentication>(context, listen: false);
          MyBookDatabase().removeMyBook(auth.currUser!.uid!, widget.myBook.bid);
          setState(() {
            isRemoved = true;
          });
          Navigator.of(context).pop();
        },
        child: const Text("Return this book"),
      ),
    ];
  }

  Row rateBook(BuildContext context) {
    return Row(
      children: [
        const Text("Rate this book: "),
        SW5,
        RatingBar(
          itemCount: 5,
          allowHalfRating: true,
          itemSize: screenWidthPercentage(context, percentage: 0.06),
          ratingWidget: ratingWidget(),
          onRatingUpdate: (value) {
            setState(() {
              widget.myBook.rating = value;
            });
          },
        ),
      ],
    );
  }

  Row myCurrentPage() {
    return Row(
      children: [
        const Text("Your current page: "),
        SizedBox(
          width: 50,
          height: 20,
          child: TextFormField(
            initialValue: widget.myBook.currentPage.toString(),
            maxLength: 5,
            decoration: const InputDecoration(counterText: ""),
            onChanged: (value) {
              setState(() {
                widget.myBook.currentPage = value.parseInt();
                if (widget.myBook.currentPage > widget.myBook.page!) {
                  widget.myBook.currentPage = widget.myBook.page!;
                }
              });
            },
          ),
        ),
        Text("/ ${widget.myBook.page}")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return isRemoved
        ? Container()
        : GestureDetector(
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
                  FadeInImage(
                    placeholder: const AssetImage("assets/images/icon.png"),
                    image: NetworkImage(widget.myBook.image!),
                    height: 120,
                    width: 80,
                    fit: BoxFit.fitHeight,
                  ),
                  SW12,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.myBook.name!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SH5,
                      Text("Author: ${widget.myBook.author}"),
                      SH5,
                      Text("Genre: ${widget.myBook.genre}"),
                      SH5,
                      Row(
                        children: [
                          Text("My rating: ${widget.myBook.rating}"),
                          SW2,
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ],
                      ),
                      SH5,
                      LinearProgressBar(
                          value:
                              widget.myBook.currentPage / widget.myBook.page!),
                      SH10,
                      Text(
                        "Due date: ${ReturnDate.formatDate(widget.myBook.dueDate!)}",
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
