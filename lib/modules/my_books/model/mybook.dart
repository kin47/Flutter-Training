import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_training/modules/books/model/book.dart';

class MyBook extends Book {
  int currentPage;
  double rating;
  Timestamp? dueDate;
  MyBook({
    required super.bid,
    required super.name,
    required super.author,
    required super.image,
    required super.genre,
    required super.page,
    this.currentPage=0,
    this.rating=0.0,
    this.dueDate,
  });
}
