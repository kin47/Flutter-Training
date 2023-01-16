import 'package:flutter/material.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:flutter_training/user/ViewModel/authentication.dart';
import 'package:flutter_training/user/widgets/input_decoration.dart';
import 'package:flutter_training/user/widgets/show_snackbar.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscureTxt = true;
  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  onObscureEyePress() {
    setState(() {
      obscureTxt = !obscureTxt;
    });
  }

  void _loginUser(String email, String password) async {
    setState(() {
      isLoading = true;
    });
    Authentication auth = Provider.of<Authentication>(context, listen: false);
    try {
      if (await auth.logIn(email, password)) {
        if(await auth.onStartUp()) {
          Navigator.of(context).pushReplacementNamed(RouteName.home);
        }
      } else {
        showSnackBar(context, "Error: ${auth.error.toString()}");
      }
    } catch (e) {
      showSnackBar(context, "Error: ${e.toString()}");
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SH30,
          loginEmailInput(),
          SH10,
          loginPasswordInput(),
          SH20,
          isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    _loginUser(_emailController.text, _passwordController.text);
                  },
                  child: const Text("Log In"),
                ),
        ],
      ),
    );
  }

  Padding loginEmailInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _emailController,
        decoration: inputDecoration("Email", const Icon(Icons.mail)),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Padding loginPasswordInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _passwordController,
        obscureText: obscureTxt,
        decoration: passwordInputDecoration("Password", onObscureEyePress),
      ),
    );
  }
}