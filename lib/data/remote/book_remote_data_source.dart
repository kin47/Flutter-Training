import 'package:flutter_training/data/dio/project_base_remote_resource.dart';
import 'package:flutter_training/modules/books/model/book.dart';

class BookRemoteDataSource extends ProjectBaseRemoteResource {
  Future<List<Book>> getBookData() async {
    List<Book> listBook = [];
    var endpoint='$url/books';
    var response = await dio.get(endpoint);
    try {
        listBook=List<Book>.from(response.data.map((e) => Book.fromJson(e)));
    } catch (e) {
      rethrow;
    }
    return listBook;
  }

  Future<bool> addBook(Book book) async {
    bool isSuccess = false;
    var endpoint='$url/books';
    try {
      await dio.post(
        endpoint,
        data: book.toJson(),
      );
      isSuccess = true;
    } catch (e) {
      rethrow;
    }
    return isSuccess;
  }
}
