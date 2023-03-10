import 'package:flutter/material.dart';
import 'package:flutter_training/data/database/mybook_database.dart';
import 'package:flutter_training/modules/my_books/model/mybook.dart';
import 'package:flutter_training/modules/user/ViewModel/authentication.dart';
import 'package:provider/provider.dart';

class MyBooksController extends ChangeNotifier{
  List<MyBook> _listBorrowedBooks=[];
  bool _isLoading = true;

  List<MyBook> get listBorrowedBooks => _listBorrowedBooks;
  bool get isLoading => _isLoading;

  void getListBorrowedBookData(BuildContext context) async {
    var user = Provider.of<Authentication>(context, listen: false);
    _listBorrowedBooks = await MyBookDatabase().getAllMyBorrowedBooks(user.currUser!.uid!);
    _isLoading=false;
    notifyListeners();
  }

  // void updateRatingAndCurrentPage(double rating, int currentPage, int index)  {
  //   _listBorrowedBooks[index].rating=rating;
  //   _listBorrowedBooks[index].currentPage=currentPage;
  //   notifyListeners();
  // }
}