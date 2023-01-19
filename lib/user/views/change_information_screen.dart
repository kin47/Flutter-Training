import 'package:flutter/material.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/helpers/default_elevated_button.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/routes/app_routes.dart';
import 'package:flutter_training/user/ViewModel/authentication.dart';
import 'package:flutter_training/user/ViewModel/user_database.dart';
import 'package:flutter_training/helpers/input_decoration.dart';
import 'package:flutter_training/helpers/show_dialog.dart';
import 'package:flutter_training/helpers/show_snackbar.dart';
import 'package:provider/provider.dart';

class ChangeInformationScreen extends StatefulWidget {
  const ChangeInformationScreen({Key? key}) : super(key: key);

  @override
  State<ChangeInformationScreen> createState() =>
      _ChangeInformationScreenState();
}

class _ChangeInformationScreenState extends State<ChangeInformationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  bool obscureTxt = true;

  onObscureEyePress() {
    setState(() {
      obscureTxt = !obscureTxt;
    });
  }

  onClose() {
    Navigator.of(context).pop();
  }

  onChangePassword() async {
    if (_newPasswordController.text.isNotEmpty &&
        _newPasswordController.text == _confirmNewPasswordController.text) {
      Authentication auth = Provider.of<Authentication>(context, listen: false);
      if (await auth.changePassword(_newPasswordController.text)) {
        customShowDialog(
            context, onClose, "Change Password Successfully", "Close");
      }
    }
  }

  onDeleteAccount() async {
    Authentication auth = Provider.of<Authentication>(context, listen: false);
    Navigator.of(context).pop();
    if (await auth.deleteAccount() &&
        await UserDatabase().deleteAccount(auth.currUser!.uid!)) {
      showSnackBar(context, "Delete Account Successfully!");
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.root, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return defaultScaffold(
      context,
      appBar: defaultAppBar(context, "Change your information"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SH10,
            const Text(
              "*Note: You don't have to change both name and password",
              style: TextStyle(
                fontSize: 10,
                color: Colors.red,
              ),
            ),
            SH30,
            const Text("Change name"),
            SH10,
            nameInput(),
            SH20,
            defaultElevatedButton(
              () async {
                Authentication auth =
                    Provider.of<Authentication>(context, listen: false);
                if (await auth.changeAuthName(_nameController.text) &&
                    await UserDatabase().changeName(
                        auth.currUser!.uid!, _nameController.text)) {
                  customShowDialog(
                      context, onClose, "Change name successfully", "Close");
                }
              },
              "Change name",
              screenWidthPercentage(context, percentage: 0.5),
            ),
            SH50,
            const Text("Change password"),
            SH10,
            currentPasswordInput(),
            SH10,
            newPasswordInput(),
            SH10,
            confirmNewPasswordInput(),
            SH20,
            defaultElevatedButton(
              onChangePassword,
              "Change Password",
              screenWidthPercentage(context, percentage: 0.5),
            ),
            TextButton(
              onPressed: () {
                twoOptionsDialog(context, onDeleteAccount, onClose,
                    "Do you want do delete your account?", "Yes", "No");
              },
              child: const Text(
                "Delete account",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
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

  Padding currentPasswordInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _currentPasswordController,
        decoration:
            passwordInputDecoration("Your current password", onObscureEyePress),
        obscureText: obscureTxt,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding newPasswordInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _newPasswordController,
        decoration: passwordInputDecoration("New password", onObscureEyePress),
        obscureText: obscureTxt,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding confirmNewPasswordInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _confirmNewPasswordController,
        decoration: passwordInputDecoration(
            "Confirm your new password", onObscureEyePress),
        obscureText: obscureTxt,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
