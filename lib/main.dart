import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_training/authentication/ViewModel/authentication.dart';
import 'package:flutter_training/routes/app_pages.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<Authentication>(create: (_) => Authentication()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xFF361A79),
          secondaryHeaderColor: const Color(0xFFF52DAA),
          backgroundColor: const Color(0xFFF3F4F6),
        ),
        initialRoute: RouteName.root,
        routes: AppPages.routes,
      ),
    );
  }
}

