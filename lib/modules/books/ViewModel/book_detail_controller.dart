import 'package:flutter/material.dart';

class BookDetailController extends ChangeNotifier {
  bool _isLoading=false;

  bool get isLoading => _isLoading;

  onBorrow() {
    _isLoading=true;
    notifyListeners();
  }

  onDone() {
    _isLoading=false;
    notifyListeners();
  }
}