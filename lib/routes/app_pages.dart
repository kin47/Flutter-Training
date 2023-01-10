import 'package:flutter_training/home/views/home_screen.dart';
import 'package:flutter_training/routes/app_routes.dart';
import '../authenticate/views/login_screen.dart';
import '../authenticate/views/signup_screen.dart';

class AppPages {
  static final routes={
    RouteName.login: (ctx) => const LoginScreen(),
    RouteName.signup: (ctx) => const SignUpScreen(),
    RouteName.home: (ctx) => const HomeScreen(),
  };
}