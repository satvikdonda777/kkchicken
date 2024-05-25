import 'package:flutter/material.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart';
import 'package:kk_chicken/features/profile/provider/profile_provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late LoginSignupProvider loginSignupProvider;
  late ProfileProvider profileProvider;
  @override
  void initState() {
    loginSignupProvider = context.read<LoginSignupProvider>();
    profileProvider = context.read<ProfileProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileProvider.emailController.text =
          loginSignupProvider.userModel?.email ?? '';
      profileProvider.fullNameController.text =
          loginSignupProvider.userModel?.fname ?? '';
      profileProvider.mobileNameController.text =
          loginSignupProvider.userModel?.mobile ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer<ProfileProvider>(
            builder: (context, profileProvider, child) {
          return Form(
            key: formState,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: profileProvider.fullNameController,
                    labelText: 'Full Name',
                    isBorderVisible: true,
                    labelTextColor: ColorTheme.blackColor,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Name can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    controller: profileProvider.mobileNameController,
                    labelText: 'Mobile',
                    isBorderVisible: true,
                    textInputType: TextInputType.phone,
                    inputFormatters: [
                      MaskTextInputFormatter(
                          mask: '##########',
                          filter: {"#": RegExp(r'[0-9]')},
                          type: MaskAutoCompletionType.lazy)
                    ],
                    labelTextColor: ColorTheme.blackColor,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Mobile can't be empty";
                      } else if (value.trim().length != 10) {
                        return "Mobile length must be 10 digit long";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    controller: profileProvider.emailController,
                    labelText: 'EMail',
                    isBorderVisible: true,
                    textInputType: TextInputType.emailAddress,
                    labelTextColor: ColorTheme.blackColor,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Email can't be empty";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value.trim())) {
                        return "Email badly formated";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: profileProvider.addressController,
                    labelText: 'Address',
                    maxLine: 4,
                    isBorderVisible: true,
                    labelTextColor: ColorTheme.blackColor,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Address can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  CustomFlatButton(
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        profileProvider.updateProfile(context: context);
                      }
                    },
                    title: 'Update',
                    borderRadius: 16,
                    width: 150,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
