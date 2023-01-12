import 'dart:convert';

import 'package:flutter_training/books/ViewModel/book_database.dart';
import 'package:flutter_training/books/model/book.dart';
import 'package:http/http.dart' as http;

class BookApi {
  var url = Uri.parse("https://63bf738ce262345656e97157.mockapi.io/books");
  Future<List<Book>> getBookData() async {
    List<Book> listBook=[];
    var response = await http.get(url);
    var returnData = json.decode(response.body);
    if (response.statusCode == 200) {
      print("Success");
      print(returnData);
      for (int i = 0; i < returnData.length; i++) {
        Book book = Book(
          bid: returnData[i]['id'],
          name: returnData[i]['name'],
          page: returnData[i]['page'],
          image: returnData[i]['image'],
          author: returnData[i]['author'],
          genre: returnData[i]['genre'],
          publishYear: returnData[i]['publish_year'],
          description: returnData[i]['description'],
        );
        listBook.add(book);
        try{
          await BookDatabase().createBook(book);
        }catch (e) {
          print(e);
        }
      }
    } else {
      print("Loi");
      print(response.statusCode);
    }
    return listBook;
  }
}
