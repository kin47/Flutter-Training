import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_training/login/views/login_screen.dart';
import 'package:flutter_training/routes/app_pages.dart';
import 'package:flutter_training/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF361A79),
        secondaryHeaderColor: const Color(0xFFF52DAA),
        backgroundColor: const Color(0xFFF3F4F6),
      ),
      initialRoute: RouteName.login,
      routes: AppPages.routes,
    );
  }
}

