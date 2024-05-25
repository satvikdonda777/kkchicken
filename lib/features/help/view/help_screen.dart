// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/help/provider/help_provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

// @RoutePage()
class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: customAppBar(title: 'Help', context: context),
      body: SafeArea(
        child: Consumer<HelpProvider>(builder: (context, helpProvider, child) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDropdownField(
                      labelText: 'Regarding',
                      controller: helpProvider.regardingController,
                      value: '1',
                      items: const ['1', '2', '3', '4', '5'],
                      onChange: (value) {
                        helpProvider.regardingController.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      labelTextColor: ColorTheme.blackColor,
                      isBorderVisible: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Name can't be empty";
                        }
                        return null;
                      },
                      controller: helpProvider.nameController,
                      hintText: 'Enter Your name',
                      labelText: 'Name',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      isBorderVisible: true,
                      labelTextColor: ColorTheme.blackColor,
                      textInputType: TextInputType.phone,
                      inputFormatters: [
                        MaskTextInputFormatter(
                            mask: '##########',
                            filter: {"#": RegExp(r'[0-9]')},
                            type: MaskAutoCompletionType.lazy)
                      ],
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Number Can't be Empty";
                        }
                        return null;
                      },
                      controller: helpProvider.mobileController,
                      hintText: 'Enter Your mobile',
                      labelText: 'Mobile',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      isBorderVisible: true,
                      labelTextColor: ColorTheme.blackColor,
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Message Can't be Empty";
                        }
                        return null;
                      },
                      maxLine: 5,
                      controller: helpProvider.messageControler,
                      hintText: 'Type your complaint and message here...',
                      labelText: 'Message',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomFlatButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      title: 'Submit',
                      borderRadius: 16,
                      width: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
