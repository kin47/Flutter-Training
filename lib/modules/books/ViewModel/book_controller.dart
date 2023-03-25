import 'package:flutter/material.dart';
import 'package:flutter_training/data/repository/book_repository.dart';
import 'package:flutter_training/modules/books/model/book.dart';

class BookController extends ChangeNotifier {
  final BookRepository _repository=BookRepository();
  bool _isLoading=true;
  List<Book> _listBooks=[];

  bool get isLoading => _isLoading;
  List<Book> get listBooks => _listBooks;

  getData() async {
    _listBooks = await _repository.getBookData();
    _isLoading=false;
    notifyListeners();
  }

  Future<void> onRefresh() async {
    var newBook = await _repository.getBookData();
    _listBooks = newBook;
    notifyListeners();
  }
}