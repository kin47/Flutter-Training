import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/helpers/custom_scaffold.dart';
import 'package:flutter_training/helpers/default_elevated_button.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/modules/user/ViewModel/authentication.dart';
import 'package:flutter_training/data/database/user_database.dart';
import 'package:flutter_training/helpers/input_decoration.dart';
import 'package:flutter_training/helpers/show_dialog.dart';
import 'package:flutter_training/modules/user/ViewModel/change_information_controller.dart';
import 'package:provider/provider.dart';

class ChangeInformationScreen extends StatelessWidget {
  const ChangeInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultScaffold(
      context,
      appBar: defaultAppBar(context, context.loc.changeInfo),
      body: SingleChildScrollView(
        child: Consumer<ChangeInformationController>(
          builder: (ctx, controller, child) => Column(
            children: [
              SH10,
              Text(
                context.loc.note,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.red,
                ),
              ),
              SH30,
              Text(context.loc.changeName),
              SH10,
              nameInput(context, controller),
              SH20,
              defaultElevatedButton(
                onPress: () async {
                  Authentication auth =
                      Provider.of<Authentication>(context, listen: false);
                  if (await auth.changeAuthName(controller.nameController.text) &&
                      await UserDatabase().changeName(
                          auth.currUser!.uid!, controller.nameController.text)) {
                    if (!context.mounted) return;
                    customShowDialog(
                        context, controller.onClose(context), context.loc.changeName, context.loc.close);
                  }
                },
                text: context.loc.changeName,
                buttonWidth: screenWidthPercentage(context, percentage: 0.5),
              ),
              SH50,
              Text(context.loc.changePassword),
              SH10,
              currentPasswordInput(context, controller),
              SH10,
              newPasswordInput(context, controller),
              SH10,
              confirmNewPasswordInput(context, controller),
              SH20,
              defaultElevatedButton(
                onPress: () async {
                  await controller.onChangePassword(context);
                },
                text: context.loc.changePassword,
                buttonWidth: screenWidthPercentage(context, percentage: 0.5),
              ),
              TextButton(
                onPressed: () {
                  twoOptionsDialog(context, controller.onDeleteAccount(context), controller.onClose(context),
                      context.loc.deleteAccAsk, context.loc.yes, context.loc.no);
                },
                child: Text(
                  context.loc.deleteAccount,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding nameInput(BuildContext context, ChangeInformationController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller.nameController,
        decoration: inputDecoration(context.loc.accountName, const Icon(Icons.person)),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding currentPasswordInput(BuildContext context, ChangeInformationController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller.currentPasswordController,
        decoration:
            passwordInputDecoration(context.loc.currentPassword, controller.onObscureEyePress),
        obscureText: controller.obscureTxt,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding newPasswordInput(BuildContext context, ChangeInformationController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller.newPasswordController,
        decoration: passwordInputDecoration(context.loc.newPassword, controller.onObscureEyePress),
        obscureText: controller.obscureTxt,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding confirmNewPasswordInput(BuildContext context, ChangeInformationController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller.confirmNewPasswordController,
        decoration: passwordInputDecoration(
            context.loc.confirmNewPassword, controller.onObscureEyePress),
        obscureText: controller.obscureTxt,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
