import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/api_service/api_service.dart';

import '../../../core/widgets/fancy_snackbar/fancy_snackbar.dart';
import '../../authentication/model/user_model.dart';

class ProfileRepo {
  final APIService _apiService = APIService();
  Future<UserResponseModel?> updateProfile(
      Map<String, dynamic> params, BuildContext context) async {
    try {
      Response? response = await _apiService.updateProfile(params);
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return UserResponseModel.fromJson(response.data);
        } else {
          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.error,
              message: response.data['error']);
        }
      }
    } on DioException catch (e) {
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error,
          message: e.response?.data['data']);

      print("Dio Error:: ${e.message}");
    } catch (e) {
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
      print("Error::: ${e.toString()}");
    }
    return null;
  }

  Future<bool> updatePassword(
      Map<String, dynamic> params, BuildContext context) async {
    try {
      Response? response = await _apiService.updatePassword(params);
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return true;
        } else {
          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.error,
              message: response.data['error']);
        }
      }
    } on DioException catch (e) {
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error,
          message: e.response?.data['data']);

      print("Dio Error:: ${e.message}");
    } catch (e) {
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
      print("Error::: ${e.toString()}");
    }
    return false;
  }
}
