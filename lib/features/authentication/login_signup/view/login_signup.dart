// import 'package:auto_route/auto_route.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/config/navigation.dart/app_route.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/core/widgets/fancy_snackbar/fancy_snackbar.dart';
import 'package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart';
import 'package:kk_chicken/features/authentication/login_signup/view/forgot_password_screen.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

// @RoutePage()
class LoginSignupScreen extends StatefulWidget {
  final bool isSignup;
  const LoginSignupScreen({super.key, this.isSignup = false});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  late LoginSignupProvider provider;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider = context.read<LoginSignupProvider>();
      provider.addressController.text = '';
      provider.confirmPasswordController.text = '';
      provider.emailController.text = '';
      provider.mobileController.text = '';
      provider.passwordController.text = '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: widget.isSignup ? "Signup" : "Login",
          context: context,
          isBackButton: Navigator.canPop(context)),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Consumer<LoginSignupProvider>(
            builder: (context, loginProvider, child) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 40.hPr(context),
                  ),
                  Center(
                    child: Image.asset(
                      AppImage.logo,
                      height: 144.hPr(context),
                      width: 182.wPr(context),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  if (widget.isSignup) ...{
                    CustomTextField(
                      labelText: 'Name',
                      controller: loginProvider.nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Name Can't be empty";
                        }
                        return null;
                      },
                      hintText: "Enter a Name ",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  },
                  CustomTextField(
                    labelText: 'Mobile',
                    controller: loginProvider.mobileController,
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
                  const SizedBox(
                    height: 12,
                  ),
                  if (widget.isSignup) ...[
                    CustomTextField(
                      labelText: 'Email',
                      controller: loginProvider.emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Email Can't be empty";
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "Email badly formated";
                        }
                        return null;
                      },
                      hintText: "Enter an Email ",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      labelText: 'Address',
                      controller: loginProvider.addressController,
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Address Can't be empty";
                        }
                        return null;
                      },
                      hintText: "Address",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                  CustomTextField(
                    labelText: 'Password',
                    controller: loginProvider.passwordController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Password Can't be empty";
                      } else if (!widget.isSignup && value.trim().length < 8) {
                        return "Password length must be 8 digit long";
                      }
                      return null;
                    },
                    hintText: "Enter a Password",
                    isObscureText: loginProvider.isPasswordObscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        loginProvider.togglePasswordObscure();
                      },
                      icon: Icon(
                        loginProvider.isPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: ColorTheme.darkGrey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (widget.isSignup) ...{
                    CustomTextField(
                      labelText: 'Confirm Password',
                      controller: loginProvider.confirmPasswordController,
                      validator: (value) {
                        if (value!.trim() !=
                            loginProvider.passwordController.text.trim()) {
                          return "Password and Confirm password does not match";
                        }
                        return null;
                      },
                      hintText: "PLease Re-enter Password",
                      isObscureText: loginProvider.isConfirmPasswordObscure,
                      suffixIcon: IconButton(
                        onPressed: () {
                          loginProvider.toggleConfirmPasswordObscure();
                        },
                        icon: Icon(
                          loginProvider.isConfirmPasswordObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: ColorTheme.darkGrey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  },
                  Visibility(
                    visible: !widget.isSignup,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Bounce(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const ForgotPasswordScreen();
                              },
                            ));
                            // context.router
                            //     .push(const ForgotPasswordScreenRoute());
                          },
                          duration: const Duration(milliseconds: 150),
                          child: Text(
                            "Forgot Password?",
                            style: FontUtilities.style(
                                fontSize: 12, fontColor: ColorTheme.orange),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomFlatButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (formKey.currentState!.validate()) {
                        Map<String, dynamic> params = {};
                        if (widget.isSignup) {
                          if (loginProvider.confirmPasswordController.text
                                  .trim() ==
                              loginProvider.passwordController.text.trim()) {
                            params = {
                              "fname": loginProvider.nameController.text.trim(),
                              "email":
                                  loginProvider.emailController.text.trim(),
                              "mobile":
                                  loginProvider.mobileController.text.trim(),
                              "password":
                                  loginProvider.passwordController.text.trim(),
                              "address":
                                  loginProvider.addressController.text.trim(),
                            };
                          } else {
                            FancySnackbar.showSnackbar(context,
                                snackBarType: FancySnackBarType.error,
                                message:
                                    "Password and Confirm Passeword does not match");
                          }
                        } else {
                          params = {
                            "mobile":
                                loginProvider.mobileController.text.trim(),
                            "password":
                                loginProvider.passwordController.text.trim(),
                          };
                        }
                        await loginProvider.loginOrRegistration(
                            params: params, context: context);
                      }
                    },
                    title: widget.isSignup ? "Signup" : "Login",
                    borderRadius: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Bounce(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LoginSignupScreen(
                            isSignup: !widget.isSignup,
                          );
                        },
                      ));
                      // context.router.push(
                      //     LoginSignupScreenRoute(isSignup: !widget.isSignup));
                    },
                    duration: const Duration(milliseconds: 150),
                    child: Text(
                      widget.isSignup
                          ? "Already have account?Login"
                          : "Create an Account?Signup",
                      style: FontUtilities.style(
                          fontSize: 12,
                          fontColor: ColorTheme.orange,
                          fontWeight: FWT.medium),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      )),
    );
  }
}
