import 'package:flutter/material.dart';
import 'package:flutter_training/extensions/loc.dart';
import 'package:flutter_training/helpers/default_elevated_button.dart';
import 'package:flutter_training/helpers/input_decoration.dart';
import 'package:flutter_training/helpers/ui_spacing.dart';
import 'package:flutter_training/helpers/show_snackbar.dart';
import 'package:flutter_training/modules/user/ViewModel/signup_controller.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpController>(
      builder: (ctx, controller, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SH30,
          nameInput(context, controller),
          SH10,
          signUpEmailInput(context, controller),
          SH10,
          signUpPasswordInput(context, controller),
          SH10,
          confirmPasswordInput(context, controller),
          SH20,
          controller.isLoading
              ? const CircularProgressIndicator()
              : defaultElevatedButton(
                  onPress: () {
                    if (controller.passwordController.text ==
                        controller.confirmPasswordController.text) {
                      controller.signupUser(context);
                    } else {
                      showSnackBar(context, context.loc.passwordNotMatch);
                    }
                  },
                  text: context.loc.signUp,
                  buttonWidth: screenWidthPercentage(context, percentage: 0.3),
                ),
        ],
      ),
    );
  }

  Padding nameInput(BuildContext context, SignUpController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller.nameController,
        decoration: inputDecoration(
            context.loc.username, const Icon(Icons.person)),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding signUpEmailInput(BuildContext context, SignUpController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: inputDecoration(
            context.loc.email, const Icon(Icons.mail)),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding signUpPasswordInput(
      BuildContext context, SignUpController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller.passwordController,
        decoration: passwordInputDecoration(
            context.loc.password,
            controller.onObscureEyePress),
        obscureText: controller.obscureTxt,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Padding confirmPasswordInput(
      BuildContext context, SignUpController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller.confirmPasswordController,
        decoration: passwordInputDecoration(
            context.loc.confirmPassword,
            controller.onObscureEyePress),
        obscureText: controller.obscureTxt,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
