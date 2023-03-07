import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/helpers/default_elevated_button.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/modules/user/ViewModel/login_controller.dart';
import 'package:flutter_training/helpers/input_decoration.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<LoginController>(
        builder: (ctx, controller, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SH30,
            loginEmailInput(context, controller),
            SH10,
            loginPasswordInput(context, controller),
            SH20,
            controller.isLoading
                ? const CircularProgressIndicator()
                : defaultElevatedButton(
                    onPress: () {
                      controller.loginUser(context);
                    },
                    text: context.loc.login,
                    buttonWidth: screenWidthPercentage(context, percentage: 0.3),
                  ),
          ],
        ),
      ),
    );
  }

  Padding loginEmailInput(BuildContext context, LoginController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller.emailController,
        decoration: inputDecoration(AppLocalizations.of(context)!.email, const Icon(Icons.mail)),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Padding loginPasswordInput(BuildContext context, LoginController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller.passwordController,
        obscureText: controller.obscureTxt,
        decoration: passwordInputDecoration(AppLocalizations.of(context)!.password, controller.onObscureEyePress),
      ),
    );
  }
}
