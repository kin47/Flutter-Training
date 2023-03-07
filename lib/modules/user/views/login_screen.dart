import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/modules/user/widgets/form_background.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:flutter_training/modules/user/widgets/login_form.dart';

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
            children: [
              FormBackground(h: 300, txt: context.loc.welcome),
              const LoginForm(),
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.loc.dontHaveAccount),
          SW8,
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteName.signup);
            },
            child: Text(context.loc.signUp),
          ),
        ],
      ),
    );
  }
}
