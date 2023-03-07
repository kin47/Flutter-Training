import 'package:flutter/material.dart';
import 'package:flutter_training/data/remote/book_remote_data_source_impl.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/extensions/num_parse_extension.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/helpers/input_decoration.dart';
import 'package:flutter_training/helpers/show_dialog.dart';
import 'package:flutter_training/modules/books/model/book.dart';

class DonateBookScreen extends StatelessWidget {
  DonateBookScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _pageController = TextEditingController();
  final TextEditingController _publishYearController = TextEditingController();
  final TextEditingController _imageURLController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return defaultScaffold(
      context,
      appBar: defaultAppBar(context, context.loc.donateTitle),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          SH20,
          Center(
            child: Text(
              context.loc.yourBookInfo,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          SH20,
          TextFormField(
            decoration: inputDecoration(context.loc.bookName, const Icon(Icons.book)),
            controller: _nameController,
            textInputAction: TextInputAction.next,
          ),
          SH10,
          TextFormField(
            decoration: inputDecoration(context.loc.author, const Icon(Icons.person)),
            controller: _authorController,
            textInputAction: TextInputAction.next,
          ),
          SH10,
          TextFormField(
            decoration:
                inputDecoration(context.loc.genre, const Icon(Icons.type_specimen)),
            controller: _genreController,
            textInputAction: TextInputAction.next,
          ),
          SH10,
          TextFormField(
            decoration:
                inputDecoration(context.loc.numberOfPages, const Icon(Icons.numbers)),
            controller: _pageController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
          ),
          SH10,
          TextFormField(
            decoration: inputDecoration(
                context.loc.publishYear, const Icon(Icons.calendar_month)),
            controller: _publishYearController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
          ),
          SH10,
          TextFormField(
            decoration:
                inputDecoration(context.loc.description, const Icon(Icons.description)),
            controller: _descriptionController,
            textInputAction: TextInputAction.next,
            maxLines: 5,
          ),
          SH20,
          Row(
            children: [
              imageBox(),
              SW16,
              SizedBox(
                width: (screenWidth(context) - 150) * 0.8,
                child: TextFormField(
                  decoration:
                      inputDecoration(context.loc.imageURL, const Icon(Icons.image)),
                  maxLines: 5,
                  textInputAction: TextInputAction.done,
                  controller: _imageURLController,
                ),
              ),
            ],
          ),
          SH20,
          ElevatedButton(
            onPressed: () async {
              Book newBook = Book(
                name: _nameController.text,
                author: _authorController.text,
                image: _imageURLController.text,
                genre: _genreController.text,
                description: _descriptionController.text,
                page: _pageController.text.parseInt(),
                publishYear: _publishYearController.text.parseInt(),
              );
              if (await BookRemoteDataSourceImpl().addBook(newBook)) {
                customShowDialog(context, () {
                  Navigator.of(context).pop();
                }, context.loc.donateSuccess, context.loc.close);
              }
            },
            child: Text(context.loc.donate),
          )
        ],
      ),
    );
  }

  Container imageBox() {
    return Container(
      width: 120,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: _imageURLController.text.isEmpty
          ? const Text('Enter a URL')
          : FittedBox(
              child: Image.network(
                _imageURLController.text,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
