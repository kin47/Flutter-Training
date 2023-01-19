import 'package:flutter/material.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/my_books/ViewModel/mybook_database.dart';
import 'package:flutter_training/my_books/model/mybook.dart';
import 'package:flutter_training/my_books/widget/my_book_card.dart';
import 'package:flutter_training/user/ViewModel/authentication.dart';
import 'package:provider/provider.dart';

class MyBooksScreen extends StatefulWidget {
  const MyBooksScreen({Key? key}) : super(key: key);

  @override
  State<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
  List<MyBook>? listBorrowedBooks;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListBorrowedBookData();
  }

  getListBorrowedBookData() async {
    var user = Provider.of<Authentication>(context, listen: false);
    listBorrowedBooks =
        await MyBookDatabase().getAllMyBorrowedBooks(user.currUser!.uid!);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return defaultScaffold(
      context,
      appBar: defaultAppBar(context, "My books"),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                return MyBookCard(myBook: listBorrowedBooks![index]);
              },
              itemCount: listBorrowedBooks!.length,
            ),
    );
  }
}