import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_training/modules/books/model/book.dart';
import 'package:flutter_training/extensions/num_parse_extension.dart';
import 'package:flutter_training/modules/my_books/model/mybook.dart';

class MyBookDatabase {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> borrowedBooks(String userId, Book book) async {
    bool isSuccess = false;
    try {
      await _firebaseFirestore
          .collection("user")
          .doc(userId)
          .collection("my_book")
          .doc(book.bid)
          .set({
        'bid': book.bid,
        'name': book.name,
        'author': book.author,
        'genre': book.genre,
        'page': book.page,
        'image': book.image,
        'rating': 0,
        'currentPage': 0,
        'dueDate': DateTime.now().add(
          const Duration(days: 7),
        ),
      });
      isSuccess = true;
    } catch (e) {
      print(e);
    }
    return isSuccess;
  }

  Future<List<MyBook>> getAllMyBorrowedBooks(String userId) async {
    QuerySnapshot querySnapshot;
    List<MyBook> borrowedBooks=[];
    try {
      querySnapshot = await _firebaseFirestore
          .collection("user")
          .doc(userId)
          .collection("my_book")
          .get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        MyBook myBook = MyBook(
          bid: querySnapshot.docs[i]['bid'].toString(),
          name: querySnapshot.docs[i]['name'],
          author: querySnapshot.docs[i]['author'],
          image: querySnapshot.docs[i]['image'],
          genre: querySnapshot.docs[i]['genre'],
          page: querySnapshot.docs[i]['page'],
          dueDate: querySnapshot.docs[i]['dueDate'],
          currentPage: querySnapshot.docs[i]['currentPage'],
          rating: querySnapshot.docs[i]['rating'].toString().parseDouble(),
        );
        borrowedBooks.add(myBook);
      }
    } catch (e) {
      print(e);
    }
    return borrowedBooks;
  }

  void updateRatingAndCurrentPage(String userId, MyBook myBook) async {
    await _firebaseFirestore.collection("user")
        .doc(userId)
        .collection("my_book")
        .doc(myBook.bid).update({
      'currentPage' : myBook.currentPage,
      'rating' : myBook.rating,
    });
  }

  void removeMyBook(String userId, String bookId) async {
    await _firebaseFirestore.collection("user").doc(userId).collection("my_book").doc(bookId).delete();
  }
}
