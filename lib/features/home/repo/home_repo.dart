// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart';
import 'package:kk_chicken/features/home/model/home_model.dart';
import 'package:kk_chicken/features/home/model/offer_model.dart';
import 'package:provider/provider.dart';

import '../../../api_service/api_service.dart';
import '../../../core/consts/api_const.dart';
import '../../../core/widgets/fancy_snackbar/fancy_snackbar.dart';

class HomeRepo {
  final APIService _apiService = APIService();

  Future<HomeModel?> getHomeData(BuildContext context) async {
    try {
      LoginSignupProvider loginSignupProvider =
          context.read<LoginSignupProvider>();
      Map<String, dynamic> params = {
        APIConst.tokenKey: APIConst.TOKEN,
        "user_id": loginSignupProvider.userModel!.userId.toString()
      };

      Response? response = await _apiService.getHomeData(params);
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return HomeModel.fromJson(response.data);
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

  Future<OfferModel?> getOffer(BuildContext context) async {
    try {
      Response? response = await _apiService.getOffer();
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return OfferModel.fromJson(response.data);
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

  Future<bool> addProductToCart(
      BuildContext context, Map<String, dynamic> params) async {
    try {
      Response? response = await _apiService.addToCart(params);
      if (response != null) {
        print("Response:: $response");
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.success,
              message: response.data['message']);
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
    } catch (e) {
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
      print("Error::: ${e.toString()}");
    }
    return false;
  }
}
