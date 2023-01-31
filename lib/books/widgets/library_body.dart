import 'package:flutter/material.dart';
import 'package:flutter_training/books/ViewModel/book_api.dart';
import 'package:flutter_training/books/model/book.dart';
import 'package:flutter_training/books/widgets/book_card.dart';

class LibraryBody extends StatefulWidget {
  const LibraryBody({Key? key}) : super(key: key);

  @override
  State<LibraryBody> createState() => _LibraryBodyState();
}

class _LibraryBodyState extends State<LibraryBody> {
  List<Book>? listBooks;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    listBooks = await BookApi().getBookData();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> onRefresh() async {
    var newBook=await BookApi().getBookData();
    setState(() {
      listBooks=newBook;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return BookCard(book: listBooks![index]);
        },
        itemCount: listBooks!.length,
      ),
    );
  }
}
