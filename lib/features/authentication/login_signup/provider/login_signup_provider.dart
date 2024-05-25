// ignore_for_file: use_build_context_synchronously

// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kk_chicken/config/config.dart';
import 'package:kk_chicken/core/consts/shared_preference_key.dart';
import 'package:kk_chicken/core/widgets/fancy_snackbar/fancy_snackbar.dart';
import 'package:kk_chicken/features/authentication/model/user_model.dart';
import 'package:kk_chicken/features/authentication/repo/auth_repo.dart';
import 'package:kk_chicken/features/home/view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSignupProvider extends ChangeNotifier {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  bool isPasswordObscure = false;
  bool isConfirmPasswordObscure = false;
  UserModel? userModel;
  double? lat;
  double? long;
  final LoginRepo _loginRepo = LoginRepo();
  // Togle password visibility
  void togglePasswordObscure() {
    isPasswordObscure = !isPasswordObscure;
    notifyListeners();
  }

  // Togle  confirm password visibility
  void toggleConfirmPasswordObscure() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
    notifyListeners();
  }

  getUserModelFromLocalStorage() async {
    UserModel? localModel = await SharedPref.getUserModel();
    if (localModel != null) {
      userModel = localModel;
    }
  }

  Future<void> loginOrRegistration(
      {required Map<String, dynamic> params,
      required BuildContext context}) async {
    try {
      EasyLoading.show();
      UserResponseModel? userResponseModel =
          await _loginRepo.loginOrSignUp(params, context);
      if (userResponseModel != null) {
        userModel = userResponseModel.userModel;
        if (userModel != null) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool(SharedPreferenceAPIKey.isUserLoggedIn, true);
          SharedPref.storeUserModel(userModel!);
          EasyLoading.dismiss();
          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.success,
              message: "Login Successfully");
          // context.router.replace(const HomeScreenRoute());
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ));
        }

        notifyListeners();
      }
    } catch (e) {
      EasyLoading.dismiss();
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> forgotPassword({required BuildContext context}) async {
    try {
      EasyLoading.show();
      Map<String, dynamic> params = {
        "mobile": mobileController.text.trim(),
        "email": emailController.text.trim()
      };
      Map<String, dynamic>? forgotPasswordResponse =
          await _loginRepo.forgotPassword(params, context);
      if (forgotPasswordResponse != null) {
        passwordController.text = forgotPasswordResponse["new_password"];
        FancySnackbar.showSnackbar(context,
            snackBarType: FancySnackBarType.success,
            message:
                "Your password reset Successfully..Your passowrd is ${forgotPasswordResponse["new_password"]}");
        Navigator.pop(context);

        notifyListeners();
      }
    } catch (e) {
      EasyLoading.dismiss();
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> getCurrentPosition(BuildContext context) async {
    final hasPermission = await _handleLocationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      lat = position.latitude;
      long = position.longitude;
    }).catchError((e) {
      EasyLoading.dismiss();
      debugPrint(e);
    });
  }

  Future<bool> _handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }
}
