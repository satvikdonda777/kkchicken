import 'dart:convert';

import 'package:kk_chicken/features/address/model/address_model.dart';
import 'package:kk_chicken/features/authentication/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceAPIKey {
  static const isUserLoggedIn = "isUserLoggedIn";
  static const userModel = "USERMODEL";
  static const userAddress = "USERADDRESS";
}

class SharedPref {
  static storeUserModel(UserModel userModel) async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(
        SharedPreferenceAPIKey.userModel, jsonEncode(userModel.toJson()));
  }

  static Future<UserModel?> getUserModel() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    String? userJson = preference.getString(SharedPreferenceAPIKey.userModel);
    if (userJson != null) {
      UserModel userModel = UserModel.fromJson(jsonDecode(userJson));
      return userModel;
    }
    return null;
  }

  static storeUserAddress(AddressModel addressModel) async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(
        SharedPreferenceAPIKey.userAddress, jsonEncode(addressModel.toJson()));
  }

  static Future<AddressModel?> getUserAddress() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    String? userJson = preference.getString(SharedPreferenceAPIKey.userAddress);
    if (userJson != null) {
      AddressModel userModel = AddressModel.fromJson(jsonDecode(userJson));
      return userModel;
    }
    return null;
  }

  static signOut() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    preference.clear();
  }
}
