import 'package:flutter_training/books/views/book_detail_screen.dart';
import 'package:flutter_training/books/views/library_screen.dart';
import 'package:flutter_training/user/views/login_screen.dart';
import 'package:flutter_training/user/views/signup_screen.dart';
import 'package:flutter_training/home/views/home_screen.dart';
import 'package:flutter_training/root.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:flutter_training/user/views/setting_screen.dart';

class AppPages {
  static final routes={
    RouteName.root: (ctx) => const RootScreen(),
    RouteName.login: (ctx) => const LoginScreen(),
    RouteName.signup: (ctx) => const SignUpScreen(),
    RouteName.home: (ctx) => const HomeScreen(),
    RouteName.settings: (ctx) => const SettingScreen(),
    RouteName.library: (ctx) => const LibraryScreen(),
  };
}