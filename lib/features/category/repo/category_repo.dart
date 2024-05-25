import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/features/category/model/category_model.dart';

import '../../../api_service/api_service.dart';
import '../../../core/widgets/fancy_snackbar/fancy_snackbar.dart';

class CategoryRepo {
  final APIService _apiService = APIService();
  Future<CategoryResponseModel?> getCategory(BuildContext context) async {
    try {
      Response? response = await _apiService.getCetegory();
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data['status'] == "success") {
          return CategoryResponseModel.fromJson(response.data);
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
