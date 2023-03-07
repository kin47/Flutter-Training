import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_training/modules/books/model/book.dart';

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

  Future<Book> getBookInfo(String bid) async {
    Book book=Book(bid: bid);
    DocumentSnapshot documentSnapshot;
    try{
      documentSnapshot=await _firebaseFirestore.collection("books").doc(bid).get();
      book.bid=bid;
      book.name=documentSnapshot['name'];
      book.description=documentSnapshot['description'];
      book.page=documentSnapshot['page'];
      book.publishYear=documentSnapshot['publish_year'];
      book.genre=documentSnapshot['genre'];
      book.image=documentSnapshot['image'];
      book.author=documentSnapshot['author'];
    }catch(e) {
      print("Loi khong lay duoc in4 sach: $e");
    }
    return book;
  }
}