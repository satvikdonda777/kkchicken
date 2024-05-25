// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart';
import 'package:kk_chicken/features/profile/repo/profile_repo.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/consts/shared_preference_key.dart';
import '../../../core/widgets/fancy_snackbar/fancy_snackbar.dart';
import '../../authentication/model/user_model.dart';

class ProfileProvider extends ChangeNotifier {
  int currentIndex = 0;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordObscure = false;
  bool isConfirmPasswordObscure = false;
  final ProfileRepo _profileRepo = ProfileRepo();
  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  togglePasswordObscre() {
    isPasswordObscure = !isPasswordObscure;
    notifyListeners();
  }

  toggleConfirmPasswordObscre() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
    notifyListeners();
  }

  Future<void> updateProfile({required BuildContext context}) async {
    try {
      EasyLoading.show();
      LoginSignupProvider loginSignupProvider =
          context.read<LoginSignupProvider>();
      Map<String, dynamic> params = {
        "userid": loginSignupProvider.userModel!.userId.toString(),
        "fname": fullNameController.text.trim(),
        "email": emailController.text.trim(),
        "mobile": mobileNameController.text.trim(),
        "address": addressController.text.trim()
      };
      UserResponseModel? userResponseModel =
          await _profileRepo.updateProfile(params, context);
      print("User Response Model :: ${loginSignupProvider.userModel!.userId}");
      if (userResponseModel != null) {
        loginSignupProvider.userModel = userResponseModel.userModel;
        if (loginSignupProvider.userModel != null) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool(SharedPreferenceAPIKey.isUserLoggedIn, true);
          SharedPref.storeUserModel(loginSignupProvider.userModel!);
          EasyLoading.dismiss();
          Navigator.pop(context);

          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.success,
              message: "Profile Updated Successfully");
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

  Future<void> updatePassowrd({required BuildContext context}) async {
    try {
      EasyLoading.show();
      LoginSignupProvider loginSignupProvider =
          context.read<LoginSignupProvider>();
      Map<String, dynamic> params = {
        "userid": loginSignupProvider.userModel!.userId.toString(),
        "mobile": mobileNameController.text.trim(),
      };
      bool isPasswordUpdate =
          await _profileRepo.updatePassword(params, context);

      if (isPasswordUpdate) {
        EasyLoading.dismiss();
        Navigator.pop(context);

        FancySnackbar.showSnackbar(context,
            snackBarType: FancySnackBarType.success,
            message: "Password Updated Successfully");

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
}
