import 'package:flutter_training/modules/books/ViewModel/book_controller.dart';
import 'package:flutter_training/modules/books/ViewModel/book_detail_controller.dart';
import 'package:flutter_training/modules/my_books/ViewModel/my_books_controller.dart';
import 'package:flutter_training/modules/user/ViewModel/authentication.dart';
import 'package:flutter_training/modules/user/ViewModel/change_information_controller.dart';
import 'package:flutter_training/modules/user/ViewModel/login_controller.dart';
import 'package:flutter_training/modules/user/ViewModel/signup_controller.dart';
import 'package:provider/provider.dart';

abstract class ProviderList {
  static final provider = [
    ListenableProvider<Authentication>(create: (_) => Authentication()),
    ListenableProvider<BookController>(create: (_) => BookController()),
    ListenableProvider<LoginController>(create: (_) => LoginController()),
    ListenableProvider<SignUpController>(create: (_) => SignUpController()),
    ListenableProvider<MyBooksController>(create: (_) => MyBooksController()),
    ListenableProvider<BookDetailController>(create: (_) => BookDetailController()),
    ListenableProvider<ChangeInformationController>(create: (_) => ChangeInformationController()),
  ];
}