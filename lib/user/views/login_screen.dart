import 'package:flutter/material.dart';
import 'package:flutter_training/ui_spacing.dart';
import 'package:flutter_training/user/widgets/form_background.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:flutter_training/user/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: const [
              FormBackground(h: 300, txt: "Welcome to Flutter Training Lib"),
              LoginForm(),
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account?"),
          SW8,
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteName.signup);
            },
            child: const Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
