// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/features/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';

// @RoutePage()
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<ProfileProvider>(
            builder: (context, profileProvider, child) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: profileProvider.passwordController,
                  labelText: 'Password',
                  isBorderVisible: true,
                  isObscureText: profileProvider.isPasswordObscure,
                  labelTextColor: ColorTheme.blackColor,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      profileProvider.togglePasswordObscre();
                    },
                    child: Icon(profileProvider.isPasswordObscure
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Password Can't be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: profileProvider.confirmPasswordController,
                  labelText: 'Confirm Password',
                  isBorderVisible: true,
                  isObscureText: profileProvider.isConfirmPasswordObscure,
                  labelTextColor: ColorTheme.blackColor,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      profileProvider.toggleConfirmPasswordObscre();
                    },
                    child: Icon(profileProvider.isConfirmPasswordObscure
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  validator: (value) {
                    if (value!.trim() !=
                        profileProvider.passwordController.text.trim()) {
                      return "Password and confirm password does not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomFlatButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      profileProvider.updatePassowrd(context: context);
                    }
                  },
                  title: 'Update',
                  borderRadius: 16,
                  width: 150,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
