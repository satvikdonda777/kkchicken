// import 'package:auto_route/auto_route.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

// @RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Forgot Password", context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Consumer<LoginSignupProvider>(
              builder: (context, loginSignupProvider, child) {
            return Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                    child: Image.asset(
                  AppImage.logo,
                  height: 144.hPr(context),
                  width: 182.wPr(context),
                )),
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  labelText: 'Enter Your Registered Mobile Number',
                  controller: loginSignupProvider.mobileController,
                  textInputType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().length != 10) {
                      return "Phone number length must me 10 digit long";
                    }
                    return null;
                  },
                  inputFormatters: [
                    MaskTextInputFormatter(
                        mask: '##########',
                        filter: {"#": RegExp(r'[0-9]')},
                        type: MaskAutoCompletionType.lazy)
                  ],
                  hintText: "Enter a Mobile Numeber ",
                ),
                CustomTextField(
                  labelText: 'Enter Your Registered Email',
                  controller: loginSignupProvider.emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email Can't be Empty";
                    }
                    return null;
                  },
                  hintText: "Enter a email",
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFlatButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    loginSignupProvider.forgotPassword(context: context);
                  },
                  title: 'Proceed',
                  borderRadius: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                Bounce(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.pop(context);
                    },
                    duration: const Duration(milliseconds: 150),
                    child: Text(
                      "Back to login",
                      style: FontUtilities.style(
                          fontSize: 14, fontColor: ColorTheme.orange),
                    ))
              ],
            );
          }),
        ),
      ),
    );
  }
}
