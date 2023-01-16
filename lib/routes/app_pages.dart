import 'package:flutter_training/books/views/library_screen.dart';
import 'package:flutter_training/home/views/home_screen.dart';
import 'package:flutter_training/user/views/change_information_screen.dart';
import 'package:flutter_training/user/views/login_screen.dart';
import 'package:flutter_training/my_books/views/my_books_screen.dart';
import 'package:flutter_training/user/views/signup_screen.dart';
import 'package:flutter_training/root.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:flutter_training/user/views/setting_screen.dart';

class AppPages {
  static final routes={
    RouteName.root: (ctx) => const RootScreen(),
    RouteName.login: (ctx) => const LoginScreen(),
    RouteName.signup: (ctx) => const SignUpScreen(),
    RouteName.settings: (ctx) => const SettingScreen(),
    RouteName.library: (ctx) => const LibraryScreen(),
    RouteName.mybooks: (ctx) => const MyBooksScreen(),
    RouteName.home: (ctx) => const HomeScreen(),
    RouteName.changeInformation: (ctx) => const ChangeInformationScreen(),
  };
}