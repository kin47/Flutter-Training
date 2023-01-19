import 'package:flutter/material.dart';
import 'package:flutter_training/books/ViewModel/book_api.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/helpers/input_decoration.dart';
import 'package:flutter_training/helpers/show_dialog.dart';

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
      appBar: defaultAppBar(context, "Donate your book here"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          SH20,
          const Center(
            child: Text(
              "Your Book Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          SH20,
          TextFormField(
            decoration: inputDecoration("Name", const Icon(Icons.book)),
            controller: _nameController,
            textInputAction: TextInputAction.next,
          ),
          SH10,
          TextFormField(
            decoration: inputDecoration("Author", const Icon(Icons.person)),
            controller: _authorController,
            textInputAction: TextInputAction.next,
          ),
          SH10,
          TextFormField(
            decoration:
                inputDecoration("Genre", const Icon(Icons.type_specimen)),
            controller: _genreController,
            textInputAction: TextInputAction.next,
          ),
          SH10,
          TextFormField(
            decoration:
                inputDecoration("Number of page", const Icon(Icons.numbers)),
            controller: _pageController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
          ),
          SH10,
          TextFormField(
            decoration: inputDecoration(
                "Publish Year", const Icon(Icons.calendar_month)),
            controller: _publishYearController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
          ),
          SH10,
          TextFormField(
            decoration:
                inputDecoration("Description", const Icon(Icons.description)),
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
                      inputDecoration("Image URL", const Icon(Icons.image)),
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
              if (await BookApi().addBook(
                  _nameController.text,
                  _authorController.text,
                  _imageURLController.text,
                  _genreController.text,
                  _descriptionController.text,
                  int.parse(_pageController.text),
                  int.parse(_publishYearController.text))) {
                customShowDialog(context, () {
                  Navigator.of(context).pop();
                }, "Thank you for donating your book", "Close");
              }
            },
            child: const Text("Donate"),
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
