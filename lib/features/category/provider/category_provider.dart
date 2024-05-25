import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kk_chicken/features/category/repo/category_repo.dart';

import '../../../core/widgets/fancy_snackbar/fancy_snackbar.dart';
import '../model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepo _categoryRepo = CategoryRepo();
  List<Category> categoryList = [];
  Future<void> getCategoryList({required BuildContext context}) async {
    try {
      EasyLoading.show();
      CategoryResponseModel? categoryResponseModel =
          await _categoryRepo.getCategory(context);
      if (categoryResponseModel != null &&
          categoryResponseModel.category != null) {
        categoryList.clear();
        categoryList.addAll(categoryResponseModel.category!);
        EasyLoading.dismiss();
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
