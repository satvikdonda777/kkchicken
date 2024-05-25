// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/core/appbar/custom_appbar.dart';
import 'package:kk_chicken/features/app_document/widget/about.dart';
import 'package:kk_chicken/features/app_document/widget/contact_us.dart';
import 'package:kk_chicken/features/app_document/widget/privacy_policy.dart';
import 'package:kk_chicken/features/app_document/widget/term_and_condition.dart';

// @RoutePage()
class AppDocumentScreen extends StatelessWidget {
  final String docType;
  const AppDocumentScreen({super.key, required this.docType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: docType, context: context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            if (docType == "Terms & Conditions") ...{
              const TermAndConditionScreen()
            } else if (docType == "Privacy Policy") ...{
              const PrivacyPolicyScreen()
            } else if (docType == "Contact Us") ...{
              const ContactUsScreen()
            } else ...{
              const AboutScreen()
            }
          ],
        ),
      ),
    );
  }
}
