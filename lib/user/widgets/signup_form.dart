import 'package:flutter/material.dart';
import 'package:flutter_training/user/ViewModel/authentication.dart';
import 'package:flutter_training/user/widgets/input_decoration.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/user/widgets/show_dialog.dart';
import 'package:flutter_training/user/widgets/show_snackbar.dart';
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
  bool isLoading = false;

  onObscureEyePress() {
    setState(() {
      obscureTxt = !obscureTxt;
    });
  }

  dialogPress() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void _signupUser(String email, String password, String name) async {
    setState(() {
      isLoading = true;
    });
    Authentication auth = Provider.of<Authentication>(context, listen: false);
    try {
      if (await auth.signUp(email, password, name)) {
        customShowDialog(context, dialogPress, "Sign Up Successfully", "Back to Login Screen");
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SH30,
        nameInput(),
        SH10,
        signUpEmailInput(),
        SH10,
        signUpPasswordInput(),
        SH10,
        confirmPasswordInput(),
        SH20,
        isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_passwordController.text ==
                      _confirmPasswordController.text) {
                    _signupUser(_emailController.text, _passwordController.text,
                        _nameController.text);
                  } else {
                    showSnackBar(context, "Password do not match");
                  }
                },
                child: const Text("Sign Up"),
              ),
      ],
    );
  }

  Padding nameInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _nameController,
        decoration: inputDecoration("Name", const Icon(Icons.person)),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding signUpEmailInput() {
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

  Padding signUpPasswordInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _passwordController,
        decoration: passwordInputDecoration("Password", onObscureEyePress),
        obscureText: obscureTxt,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding confirmPasswordInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _confirmPasswordController,
        decoration: passwordInputDecoration("Confirm Password", onObscureEyePress),
        obscureText: obscureTxt,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}