// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/api_service/api_service.dart';
import 'package:kk_chicken/core/consts/api_const.dart';
import 'package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart';
import 'package:kk_chicken/features/cart/model/shiping_model.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/fancy_snackbar/fancy_snackbar.dart';
import '../model/cart_model.dart';

class CartRepo {
  final APIService _apiService = APIService();
  Future<CartModel?> getCart(
      BuildContext context, Map<String, dynamic> params) async {
    try {
      Response? response = await _apiService.getMyCart(params);
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return CartModel.fromJson(response.data);
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

  Future<ShipingCost?> getShipingCost(
      BuildContext context, Map<String, dynamic> params) async {
    try {
      Response? response = await _apiService.getShipingCost(params);
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return ShipingCost.fromJson(response.data);
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

  Future<Map<String, dynamic>?> clearCartList(BuildContext context) async {
    try {
      LoginSignupProvider _loginSignUpProvider =
          context.read<LoginSignupProvider>();
      Map<String, dynamic> params = {
        "token": APIConst.TOKEN,
        "user_id": _loginSignUpProvider.userModel!.userId.toString()
      };
      Response? response = await _apiService.clearCart(params);
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

  Future<Map<String, dynamic>?> increaseDecreaseItem(BuildContext context,
      {required Map<String, dynamic> params, bool isIncrease = true}) async {
    try {
      Response? response = isIncrease
          ? await _apiService.increaseItemQuantity(params)
          : await _apiService.decreaseItemQuantity(params);
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return response.data;
        } else {
          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.error,
              message: response.data['message']);
        }
      }
    } on DioException catch (e) {
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error,
          message: e.response?.data['message']);

      print("Dio Error:: ${e.message}");
    } catch (e) {
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
      print("Error::: ${e.toString()}");
    }
    return null;
  }

  Future<Map<String, dynamic>?> placeOrder(
      BuildContext context, Map<String, dynamic> params) async {
    try {
      Response? response = await _apiService.placeOrder(params);
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
