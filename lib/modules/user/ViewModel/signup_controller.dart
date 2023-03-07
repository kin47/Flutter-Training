import 'package:flutter/material.dart';
import 'package:flutter_training/helpers/show_dialog.dart';
import 'package:flutter_training/helpers/show_snackbar.dart';
import 'package:flutter_training/modules/user/ViewModel/authentication.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpController extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscureTxt = true;
  bool _isLoading = false;

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;
  bool get obscureTxt => _obscureTxt;
  bool get isLoading => _isLoading;

  onObscureEyePress() {
    _obscureTxt = !_obscureTxt;
    notifyListeners();
  }

  dialogPress(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void signupUser(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    Authentication auth = Provider.of<Authentication>(context, listen: false);
    try {
      if (await auth.signUp(_emailController.text, _passwordController.text, _nameController.text)) {
        customShowDialog(context, dialogPress(context), AppLocalizations.of(context)!.signUpSuccess, AppLocalizations.of(context)!.backToLoginScreen);
        } else {
        showSnackBar(context, "Error: ${auth.error.toString()}");
      }
    } catch (e) {
      showSnackBar(context, "Error: ${e.toString()}");
    }
    _isLoading = false;
    notifyListeners();
  }
}