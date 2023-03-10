import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_training/providers/provider_list.dart';
import 'package:flutter_training/routes/custom_route.dart';
import 'package:flutter_training/routes/app_pages.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.changeLanguage(newLocale);
  }

  static String getLocale(BuildContext context) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    if (state!.local == const Locale('en', 'US')) {
      return 'en';
    } else {
      return 'vn';
    }
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale local = const Locale('en', 'US');

  changeLanguage(Locale locale) {
    setState(() {
      local = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderList.provider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xFF361A79),
          secondaryHeaderColor: const Color(0xFFF52DAA),
          backgroundColor: const Color(0xFFF3F4F6),
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
              TargetPlatform.windows: CustomPageTransitionBuilder(),
            },
          ),
        ),
        locale: local,
        initialRoute: RouteName.root,
        routes: AppPages.routes,
        supportedLocales: getSupportedLocal(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    );
  }

  List<Locale> getSupportedLocal() {
    return [
      const Locale('en', 'US'),
      const Locale('vi', 'VN'),
    ];
  }
}
