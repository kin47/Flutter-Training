import 'package:flutter/material.dart';
import 'package:flutter_training/authenticate/model/authenticate.dart';
import 'package:flutter_training/authenticate/views/login_screen.dart';
import 'package:flutter_training/home/views/home_screen.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool loggedIn = false;
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Authenticate auth=Provider.of<Authenticate>(context, listen: false);
    if(await auth.onStartUp()) {
      setState(() {
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
