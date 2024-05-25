// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/api_service/api_service.dart';
import 'package:kk_chicken/features/address/model/area_model.dart';
import 'package:kk_chicken/features/address/model/time_slot_model.dart';

import '../../../core/widgets/fancy_snackbar/fancy_snackbar.dart';

class AddressRepo {
  final APIService _apiService = APIService();
  Future<AreaModel?> getAreaList(
      BuildContext context, Map<String, dynamic> params) async {
    try {
      Response? response = await _apiService.getAvailableArea(params);
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return AreaModel.fromJson(response.data);
        } else {
          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.error,
              message: response.data['message']);
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

  Future<String?> getUserCurrentLocation(
      BuildContext context, Map<String, dynamic> params) async {
    try {
      Response? response = await _apiService.getUserCurrentLocation(params);
      print("Response::: ${response}");
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return response.data['location'];
        } else {
          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.error,
              message: response.data['message']);
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

  Future<TimeSlotModel?> getDeliveryTimeSlot(BuildContext context) async {
    try {
      Response? response = await _apiService.getDeliveryTimeSlot();
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return TimeSlotModel.fromJson(response.data);
        } else {
          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.error,
              message: response.data['message']);
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
