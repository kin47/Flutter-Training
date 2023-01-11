import 'package:flutter/material.dart';
import 'package:flutter_training/authenticate/model/authenticate.dart';
import 'package:flutter_training/authenticate/widgets/input_decoration.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:provider/provider.dart';
import '../../ui_spacing.dart';

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

  void _showErrorDialog(String message) {
    var snackbar = SnackBar(
      content: Text(message),
      margin: const EdgeInsets.only(left: 24, right: 24),
      behavior: SnackBarBehavior.floating,
      shape: const StadiumBorder(),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future<void> _loginUser(String email, String password) async {
    setState(() {
      isLoading=true;
    });
    Authenticate auth = Provider.of<Authenticate>(context, listen: false);
    try {
      if (await auth.logIn(email, password)) {
        Navigator.of(context).pushReplacementNamed(RouteName.home);
      } else {
        _showErrorDialog("Error: ${auth.error.toString()}");
      }
    } catch (e) {
      print(e);
      _showErrorDialog("Error: ${e.toString()}");
    }
    setState(() {
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SH30,
        LoginEmailInput(),
        SH10,
        LoginPasswordInput(),
        SH20,
        isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  _loginUser(_emailController.text, _passwordController.text);
                },
                child: const Text("Log In"),
              )
      ],
    );
  }

  Padding LoginEmailInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: _emailController,
        decoration: inputDecoration("Email", const Icon(Icons.mail)),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Padding LoginPasswordInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: _passwordController,
        obscureText: obscureTxt,
        decoration: passwordInputDecoration("Password"),
      ),
    );
  }

  InputDecoration passwordInputDecoration(String txt) {
    return InputDecoration(
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14),
      focusColor: const Color(0xFF361A79),
      hintText: txt,
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: IconButton(
        icon: const Icon(Icons.remove_red_eye),
        onPressed: () {
          setState(() {
            obscureTxt = !obscureTxt;
          });
        },
      ),
    );
  }
}
