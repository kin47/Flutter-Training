import 'package:flutter/material.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/user/widgets/form_background.dart';
import 'package:flutter_training/user/widgets/signup_form.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return defaultScaffold(context,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
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
              FormBackground(h: 400, txt: "Let's create an account"),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}