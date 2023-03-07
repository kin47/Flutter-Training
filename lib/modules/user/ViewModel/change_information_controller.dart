import 'package:flutter/material.dart';
import 'package:flutter_training/data/database/user_database.dart';
import 'package:flutter_training/helpers/show_dialog.dart';
import 'package:flutter_training/helpers/show_snackbar.dart';
import 'package:flutter_training/modules/user/ViewModel/authentication.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ChangeInformationController extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();
  bool _obscureTxt = true;

  TextEditingController get nameController => _nameController;
  TextEditingController get currentPasswordController => _currentPasswordController;
  TextEditingController get newPasswordController => _newPasswordController;
  TextEditingController get confirmNewPasswordController => _confirmNewPasswordController;
  bool get obscureTxt => _obscureTxt;

  onObscureEyePress() {
    _obscureTxt = !_obscureTxt;
    notifyListeners();
  }

  onClose(BuildContext context) {
    Navigator.of(context).pop();
  }

  onChangePassword(BuildContext context) async {
    if (_newPasswordController.text.isNotEmpty &&
        _newPasswordController.text == _confirmNewPasswordController.text) {
      Authentication auth = Provider.of<Authentication>(context, listen: false);
      if (await auth.changePassword(_newPasswordController.text)) {
        if (!context.mounted) return;
        customShowDialog(
            context, onClose(context), "Change Password Successfully", "Close");
      }
    }
  }

  onDeleteAccount(BuildContext context) async {
    Authentication auth = Provider.of<Authentication>(context, listen: false);
    Navigator.of(context).pop();
    if (await auth.deleteAccount() &&
        await UserDatabase().deleteAccount(auth.currUser!.uid!)) {
      if (!context.mounted) return;
      showSnackBar(context, "Delete Account Successfully!");
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.root, (route) => false);
    }
  }
}