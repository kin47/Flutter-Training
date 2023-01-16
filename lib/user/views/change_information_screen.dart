import 'package:flutter/material.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/user/ViewModel/authentication.dart';
import 'package:flutter_training/user/ViewModel/user_database.dart';
import 'package:flutter_training/user/widgets/input_decoration.dart';
import 'package:flutter_training/user/widgets/show_dialog.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change your information"),
      ),
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
            SH50,
            const Text("Change password"),
            SH10,
            currentPasswordInput(),
            SH10,
            newPasswordInput(),
            SH10,
            confirmNewPasswordInput(),
            SH20,
            ElevatedButton(
              onPressed: () async {
                Authentication auth =
                    Provider.of<Authentication>(context, listen: false);
                if (_nameController.text.isNotEmpty &&
                    _nameController.text != auth.currentUser!.name!) {
                  if (await UserDatabase().changeName(
                      auth.currentUser!.uid!, _nameController.text)) {
                    auth.currentUser!.name = _nameController.text;
                    customShowDialog(context, () {
                      Navigator.of(context).pop();
                    }, "Change Name Successfully", "Close");
                  }
                }
              },
              child: const Text("Change information"),
            ),
            TextButton(
              onPressed: () {},
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
        textInputAction: TextInputAction.done,
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
