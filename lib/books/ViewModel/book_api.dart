import 'package:flutter_training/books/ViewModel/book_database.dart';
import 'package:flutter_training/books/model/book.dart';
import 'package:dio/dio.dart';

class BookApi {
  Future<List<Book>> getBookData() async {
    List<Book> listBook=[];
    var dio=Dio();
    try{
      var response = await dio.get("https://63bf738ce262345656e97157.mockapi.io/books");
      if(response.statusCode==200) {
        for(var returnData in response.data) {
          Book book = Book(
            bid: returnData['id'],
            name: returnData['name'],
            page: returnData['page'],
            image: returnData['image'],
            author: returnData['author'],
            genre: returnData['genre'],
            publishYear: returnData['publish_year'],
            description: returnData['description'],
          );
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
}
