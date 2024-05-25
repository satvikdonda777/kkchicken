// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:kk_chicken/api_service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:kk_chicken/core/widgets/fancy_snackbar/fancy_snackbar.dart';
import '../model/user_model.dart';

class LoginRepo {
  final APIService _apiService = APIService();

  Future<UserResponseModel?> loginOrSignUp(
      Map<String, dynamic> params, BuildContext context) async {
    try {
      Response? response = params.containsKey("fname")
          ? await _apiService.register(params)
          : await _apiService.login(params);
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return UserResponseModel.fromJson(response.data);
        } else {
          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.error,
              message: response.data['data']);
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

  Future<Map<String, dynamic>?> forgotPassword(
      Map<String, dynamic> params, BuildContext context) async {
    try {
      Response? response = await _apiService.forgotPassword(params);
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return response.data;
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
}
