import 'package:flutter_training/data/remote/book_remote_data_source.dart';
import 'package:flutter_training/data/repository/book_repository.dart';
import 'package:flutter_training/modules/books/model/book.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource _remote=BookRemoteDataSource();
  @override
  Future<List<Book>> getBookData() {
    return _remote.getBookData();
  }

  @override
  Future<bool> addBook(Book book) {
    return _remote.addBook(book);
  }
}