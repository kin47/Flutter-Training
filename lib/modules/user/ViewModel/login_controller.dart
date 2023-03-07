import 'package:flutter/material.dart';
import 'package:flutter_training/helpers/show_snackbar.dart';
import 'package:flutter_training/modules/user/ViewModel/authentication.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:provider/provider.dart';

class LoginController extends ChangeNotifier{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureTxt = true;
  bool _isLoading = false;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get obscureTxt => _obscureTxt;
  bool get isLoading => _isLoading;

  onObscureEyePress() {
    _obscureTxt = !_obscureTxt;
    notifyListeners();
  }

  void loginUser(BuildContext context) async {
    _isLoading=true;
    notifyListeners();
    Authentication auth = Provider.of<Authentication>(context, listen: false);
    try {
      if (await auth.logIn(_emailController.text, _passwordController.text)) {
        if (await auth.onStartUp()) {
          Navigator.of(context).pushReplacementNamed(RouteName.home);
        }
      } else {
        showSnackBar(context, "Error: ${auth.error.toString()}");
      }
    } catch (e) {
      showSnackBar(context, "Error: ${e.toString()}");
    }
    _isLoading=false;
    notifyListeners();
  }
}