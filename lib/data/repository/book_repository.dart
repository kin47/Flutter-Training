import 'package:flutter_training/data/remote/book_remote_data_source.dart';
import 'package:flutter_training/modules/books/model/book.dart';

class BookRepository {
  final BookRemoteDataSource _remote=BookRemoteDataSource();
  Future<List<Book>> getBookData() => _remote.getBookData();
  Future<bool> addBook(Book book) => _remote.addBook(book);
}