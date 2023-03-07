import 'package:flutter/material.dart';
import 'package:flutter_training/modules/books/ViewModel/book_controller.dart';
import 'package:flutter_training/modules/books/widgets/book_card.dart';
import 'package:provider/provider.dart';

class LibraryBody extends StatelessWidget {
  const LibraryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookController>(
      builder: (cxt, controller, child) {
        controller.getData();
        return controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return BookCard(book: controller.listBooks[index]);
                  },
                  itemCount: controller.listBooks.length,
                ),
              );
      },
    );
  }
}
