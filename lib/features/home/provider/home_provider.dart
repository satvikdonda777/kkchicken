// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart';
import 'package:kk_chicken/features/home/model/home_model.dart';
import 'package:kk_chicken/features/home/model/offer_model.dart';
import 'package:kk_chicken/features/home/repo/home_repo.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/fancy_snackbar/fancy_snackbar.dart';

class HomeProvider extends ChangeNotifier {
  int currentAdsIndex = 0;
  int totalCount = 0;
  HomeModel? homeModel;
  OfferModel? offerModel;
  List<HomeData> chikenList = [];
  List<HomeData> foodList = [];
  List<HomeData> searchedList = [];
  bool isSearch = false;
  final HomeRepo _homeRepo = HomeRepo();
  onAdChange(int value) {
    currentAdsIndex = value;
    notifyListeners();
  }

  Future<void> addProductToCart(BuildContext context, HomeData homeData) async {
    LoginSignupProvider loginSignupProvider =
        context.read<LoginSignupProvider>();
    try {
      Map<String, dynamic> params = {
        "token":
            "dfd65117f5a90cf87c1664e5f6db4d68b2d1e70e6bc2e96f9a5e40e995b0c066",
        "user_id": loginSignupProvider.userModel!.userId.toString(),
        "items": [
          {
            "itemname": homeData.name,
            "itemid": homeData.id.toString(),
            "itemquantity": homeData.qnt.toString(),
            "itemquantitytype": "pieces",
            "Mquantity": homeData.quantity,
            "itemprice": int.parse(homeData.price ?? '0').toString(),
            "itemtotal":
                (int.parse(homeData.price ?? '0') * (homeData.qnt ?? 0))
                    .toString()
          }
        ]
      };
      bool? isSucess = await _homeRepo.addProductToCart(context, params);
      if (isSucess) {
        homeModel!.cartCount = (homeModel!.cartCount ?? 0) + 1;
      }
    } catch (e) {
      EasyLoading.dismiss();
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
    notifyListeners();
  }

  void removeProductToCart() {
    if (totalCount == 0) {
      return;
    }
    totalCount--;
    notifyListeners();
  }

  bool isLoading = false;
  Future<void> getHomeData({required BuildContext context}) async {
    try {
      EasyLoading.show();
      isLoading = true;
      notifyListeners();
      HomeModel? homeModelApi = await _homeRepo.getHomeData(context);
      if (homeModelApi != null) {
        print("Home Model: $homeModelApi");
        homeModel = homeModelApi;
        chikenList = homeModel!.homeData!
            .where((element) => element.category == '7')
            .toList();
        foodList = homeModel!.homeData!
            .where((element) => element.category == '9')
            .toList();
        isLoading = false;
        EasyLoading.dismiss();
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      EasyLoading.dismiss();
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
    }
  }

  Future<void> getOfferProduct({required BuildContext context}) async {
    try {
      EasyLoading.show();
      OfferModel? homeModelApi = await _homeRepo.getOffer(context);
      print("HOme APiiiii: $homeModelApi");
      if (homeModelApi != null && homeModelApi.offer != null) {
        offerModel = homeModelApi;

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

  void searchProduct(String value) async {
    if (value.trim().isEmpty) {
      isSearch = false;
      notifyListeners();
    } else {
      isSearch = true;
      searchedList.clear();
      searchedList.addAll(chikenList.where((element) =>
          element.name!.toLowerCase().contains(value.toLowerCase())));
      searchedList.addAll(foodList.where((element) =>
          element.name!.toLowerCase().contains(value.toLowerCase())));
      notifyListeners();
    }
  }
}
