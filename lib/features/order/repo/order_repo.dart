import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/api_service/api_service.dart';
import 'package:kk_chicken/core/consts/api_const.dart';
import 'package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart';
import 'package:kk_chicken/features/order/model/invoice_model.dart';
import 'package:kk_chicken/features/order/model/order_model.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/fancy_snackbar/fancy_snackbar.dart';

class OrderRepo {
  final APIService _apiService = APIService();
  Future<MyOrderModel?> getMyOrderList(BuildContext context) async {
    try {
      LoginSignupProvider loginSignupProvider =
          context.read<LoginSignupProvider>();
      Response? response = await _apiService.fetchOrder({
        "user_id": loginSignupProvider.userModel!.userId,
        "token": APIConst.TOKEN
      });
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return MyOrderModel.fromJson(response.data);
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

  Future<InvoiceResponseModel?> getOrderInvoice(
    BuildContext context,
    int orderId,
  ) async {
    try {
      Response? response = await _apiService.getOrderDetails(
          {"orderid": orderId.toString(), "token": APIConst.TOKEN});
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return InvoiceResponseModel.fromJson(response.data);
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

  Future<Map<String, dynamic>?> cancelOrder(
      BuildContext context, int orderId) async {
    try {
      Response? response = await _apiService.cancelOrder(
          {"orderid": orderId.toString(), "token": APIConst.TOKEN});
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
