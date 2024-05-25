// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/profile/provider/profile_provider.dart';
import 'package:kk_chicken/features/profile/view/change_password_screen.dart';
import 'package:kk_chicken/features/profile/view/edit_profile_screen.dart';
import 'package:provider/provider.dart';

// @RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'My Profile', context: context),
      body: SafeArea(child:
          Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: CustomToggleButton(
                textList: const ['Profile', 'Password'],
                provider: profileProvider,
              ),
            ),
            if (profileProvider.currentIndex == 0) ...{
              const EditProfileScreen()
            } else ...{
              const ChangePasswordScreen()
            }
          ],
        );
      })),
    );
  }
}
