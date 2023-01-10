import 'package:flutter_training/routes/app_routes.dart';
import '../login/views/login_screen.dart';
import '../signup/views/signup_screen.dart';

class AppPages {
  static final routes={
    RouteName.login: (ctx) => LoginScreen(),
    RouteName.signup: (ctx) => SignUpScreen(),
  };
}