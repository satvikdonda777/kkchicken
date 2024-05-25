// ignore_for_file: use_build_context_synchronously

// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kk_chicken/config/config.dart';
import 'package:kk_chicken/config/navigation.dart/app_route.dart';
import 'package:kk_chicken/core/app_assets/asset_image.dart';
import 'package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart';
import 'package:kk_chicken/features/authentication/login_signup/view/login_signup.dart';
import 'package:kk_chicken/features/home/view/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/consts/shared_preference_key.dart';
import '../../../core/core.dart';

// @RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late LoginSignupProvider loginSignupProvider;
  @override
  void initState() {
    loginSignupProvider = context.read<LoginSignupProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isUserLoggedIn =
          prefs.getBool(SharedPreferenceAPIKey.isUserLoggedIn);
      if (isUserLoggedIn ?? false) {
        EasyLoading.show();
        await loginSignupProvider.getUserModelFromLocalStorage();
        await loginSignupProvider.getCurrentPosition(context);
        EasyLoading.dismiss();
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ));
        // context.router.replace(const HomeScreenRoute());
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const LoginSignupScreen();
          },
        ));
        // context.router.replace(LoginSignupScreenRoute());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppImage.logo)),
    );
  }
}
