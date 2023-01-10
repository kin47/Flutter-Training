import 'package:flutter/material.dart';
import 'package:flutter_training/routes/app_routes.dart';
import '../../ui_spacing.dart';
import '../widgets/input_decoration.dart';

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
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                width: screenWidthPercentage(context, percentage: 0.95),
                alignment: Alignment.topCenter,
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SH30,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: inputDecoration("Email", const Icon(Icons.mail)),

                    ),
                  ),
                  SH10,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: inputDecoration("Password", const Icon(Icons.lock)),

                    ),
                  ),
                  SH20,
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ]
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
