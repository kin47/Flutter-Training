import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/extensions/num_parse_extension.dart';
import 'package:flutter_training/extensions/return_date.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/data/database/mybook_database.dart';
import 'package:flutter_training/modules/my_books/model/mybook.dart';
import 'package:flutter_training/modules/my_books/widget/linear_progress_bar.dart';
import 'package:flutter_training/modules/user/ViewModel/authentication.dart';
import 'package:flutter_training/modules/user/widgets/rating_widget.dart';
import 'package:provider/provider.dart';

class MyBookCard extends StatefulWidget {
  const MyBookCard({
    Key? key,
    required this.myBook,
    required this.index,
  }) : super(key: key);
  final MyBook myBook;
  final int index;

  @override
  State<MyBookCard> createState() => _MyBookCardState();
}

class _MyBookCardState extends State<MyBookCard> {
  bool isRemoved = false;
  double bookRating=0;
  int currentBookPage=0;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => SingleChildScrollView(
        child: AlertDialog(
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
                myCurrentPage(context),
              ],
            ),
          ),
          actions: actions(context),
        ),
      ),
    );
  }

  List<Widget> actions(BuildContext context) {
    return <Widget>[
      TextButton(
        onPressed: () {
          setState(() {
            widget.myBook.rating=bookRating;
            widget.myBook.currentPage=currentBookPage;
          });
          Navigator.of(context).pop();
          var auth = Provider.of<Authentication>(context, listen: false);
          MyBookDatabase()
              .updateRatingAndCurrentPage(auth.currUser!.uid!, widget.myBook);
        },
        child: Text(context.loc.close),
      ),
      TextButton(
        onPressed: () {
          var auth = Provider.of<Authentication>(context, listen: false);
          MyBookDatabase()
              .removeMyBook(auth.currUser!.uid!, widget.myBook.bid!);
          setState(() {
            isRemoved = true;
          });
          Navigator.of(context).pop();
        },
        child: Text(context.loc.returnBook),
      ),
    ];
  }

  Row rateBook(BuildContext context) {
    return Row(
      children: [
        Text(context.loc.rateBook),
        SW5,
        RatingBar(
          itemCount: 5,
          allowHalfRating: true,
          itemSize: screenWidthPercentage(context, percentage: 0.06),
          ratingWidget: ratingWidget(),
          onRatingUpdate: (value) {
            setState(() {
              bookRating = value;
            });
          },
        ),
      ],
    );
  }

  Row myCurrentPage(BuildContext context) {
    return Row(
      children: [
        Text(context.loc.currentPage),
        SizedBox(
          width: 50,
          height: 20,
          child: TextFormField(
            initialValue: widget.myBook.currentPage.toString(),
            maxLength: 5,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(counterText: ""),
            onChanged: (value) {
              setState(() {
                currentBookPage = value.parseInt();
                if (currentBookPage > widget.myBook.page!) {
                  currentBookPage = widget.myBook.page!;
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
                      Text("${context.loc.author}: ${widget.myBook.author}"),
                      SH5,
                      Text("${context.loc.genre}: ${widget.myBook.genre}"),
                      SH5,
                      Row(
                        children: [
                          Text(
                              "${context.loc.myRating}: ${widget.myBook.rating}"),
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
                        "${context.loc.dueDate}: ${ReturnDate.formatDate(widget.myBook.dueDate!)}",
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
