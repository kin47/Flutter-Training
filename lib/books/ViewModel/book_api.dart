import 'package:flutter_training/books/ViewModel/book_database.dart';
import 'package:flutter_training/books/model/book.dart';
import 'package:dio/dio.dart';
import 'package:flutter_training/books/remote/api.dart';

class BookApi {
  var dio=Dio();
  Future<List<Book>> getBookData() async {
    List<Book> listBook=[];
    try{
      var response = await dio.get(API.url);
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
          await BookDatabase().createBook(book);
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

  Future<bool> addBook(String name, String author, String image, String genre, String description, int page, int publishYear) async {
    bool isSuccess=false;
    try{
      var response=await dio.post(API.url, data: {
        'name' : name,
        'author' : author,
        'image' : image,
        'genre' : genre,
        'description' : description,
        'page' : page,
        'publish_year' : publishYear,
      });
      print(response.statusCode);
      isSuccess=true;
    }catch(e) {
      print("Can't post to API");
    }
    return isSuccess;
  }
}
