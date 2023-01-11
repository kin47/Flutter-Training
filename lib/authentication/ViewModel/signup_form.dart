import 'package:flutter/material.dart';
import 'package:flutter_training/authentication/model/authentication.dart';
import 'package:flutter_training/authentication/widgets/input_decoration.dart';
import 'package:flutter_training/ui_spacing.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool obscureTxt = true;

  void _showErrorDialog(String message) {
    var snackbar = SnackBar(
      content: Text(message),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      behavior: SnackBarBehavior.floating,
      shape: const StadiumBorder(),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Sign Up Successfully"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("Back to Login Screen"),
          ),
        ],
      ),
    );
  }

  Future<void> _signupUser(
      String email, String password) async {
    Authentication auth = Provider.of<Authentication>(context, listen: false);
    try {
      if (await auth.signUp(email, password)) {
        _showSuccessDialog();
      }
      else {
        _showErrorDialog("Error: ${auth.error}");
      }
    } catch (e) {
      _showErrorDialog("Error: ${e.toString()}");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SH30,
        NameInput(),
        SH10,
        SignUpEmailInput(),
        SH10,
        SignUpPasswordInput(),
        SH10,
        ConfirmPasswordInput(),
        SH20,
        ElevatedButton(
          onPressed: () {
            if (_passwordController.text == _confirmPasswordController.text) {
              _signupUser(_emailController.text, _passwordController.text);
            }
            else {
              _showErrorDialog("Password do not match");
            }
          },
          child: const Text("Sign Up"),
        ),
      ],
    );
  }

  Padding NameInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _nameController,
        decoration: inputDecoration("Name", const Icon(Icons.person)),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding SignUpEmailInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: inputDecoration("Email", const Icon(Icons.mail)),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding SignUpPasswordInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _passwordController,
        decoration: passwordInputDecoration("Password"),
        obscureText: obscureTxt,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding ConfirmPasswordInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _confirmPasswordController,
        decoration: passwordInputDecoration("Confirm Password"),
        obscureText: obscureTxt,
        textInputAction: TextInputAction.done,
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
