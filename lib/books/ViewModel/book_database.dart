import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_training/books/model/book.dart';

class BookDatabase{
  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
  Future<bool> createBook(Book book) async {
    bool isSuccess=false;
    try{
      _firebaseFirestore.collection("books").doc(book.bid).set({
        'name' : book.name,
        'author' : book.author,
        'genre' : book.genre,
        'publish_year' : book.publishYear,
        'page' : book.page,
        'image' : book.image,
        'description' : book.description,
      });
      isSuccess=true;
    } catch(e) {
      print(e);
    }
    return isSuccess;
  }
}