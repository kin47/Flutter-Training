import 'package:dio/dio.dart';
import 'package:flutter_training/data/database/book_database.dart';
import 'package:flutter_training/modules/books/model/book.dart';
import 'package:flutter_training/data/remote/book_remote_data_source.dart';
import 'api.dart';

class BookRemoteDataSourceImpl implements BookRemoteDataSource{
  var dio=Dio();
  @override
  Future<List<Book>> getBookData() async {
    List<Book> listBook=[];
    try{
      var response = await dio.get(API.url);
      if(response.statusCode==200) {
        for(var returnData in response.data) {
          Book book = Book.fromJson(returnData);
          listBook.add(book);
        }
      }
      else{
        print("Loi API 1: ${response.statusCode}");
      }
    }catch(e) {
      print("Loi API 2: $e");
    }
    return listBook;
  }

  @override
  Future<bool> addBook(Book book) async {
    bool isSuccess=false;
    try{
      var response=await dio.post(API.url, data: book.toJson());
      print(response.statusCode);
      isSuccess=true;
    }catch(e) {
      print("Can't post to API");
    }
    return isSuccess;
  }
}