import 'package:flutter/material.dart';
import 'package:flutter_training/authentication/ViewModel/signup_form.dart';
import 'package:flutter_training/authentication/widgets/form_background.dart';
import 'package:flutter_training/ui_spacing.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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