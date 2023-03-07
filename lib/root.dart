import 'package:flutter/material.dart';
import 'package:flutter_training/main.dart';
import 'package:flutter_training/modules/user/ViewModel/authentication.dart';
import 'package:flutter_training/modules/user/model/our_user.dart';
import 'package:flutter_training/modules/user/views/login_screen.dart';
import 'package:flutter_training/modules/home/views/home_screen.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool loggedIn = false;
  OurUser? user;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    Authentication auth=Provider.of<Authentication>(context, listen: false);
    if(await auth.onStartUp()) {
      setState(() {
        user=auth.currUser;
        if(user!.language=='en') {
          MyApp.setLocale(context, const Locale('en', 'US'));
        } else {
          MyApp.setLocale(context, const Locale('vi', 'VN'));
        }
        loggedIn=true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget returnScreen;
    if (loggedIn) {
      returnScreen = const HomeScreen();
    } else {
      returnScreen = const LoginScreen();
    }
    return returnScreen;
  }
}