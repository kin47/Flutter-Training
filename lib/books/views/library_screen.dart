import 'package:flutter/material.dart';
import 'package:flutter_training/books/ViewModel/book_api.dart';
import 'package:flutter_training/books/model/book.dart';
import 'package:flutter_training/books/widgets/book_card.dart';
import 'package:flutter_training/routes/app_routes.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryState();
}

class _LibraryState extends State<LibraryScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our library!"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                return BookCard(book: listBooks![index]);
              },
              itemCount: listBooks!.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteName.donate);
        },
        tooltip: "Donate your book to our library here",
        child: const Icon(Icons.add),
      ),
    );
  }
}
