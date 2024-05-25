// ignore_for_file: use_build_context_synchronously

// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kk_chicken/config/config.dart';
import 'package:kk_chicken/core/consts/api_const.dart';
import 'package:kk_chicken/features/address/provider/address_provider.dart';
import 'package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart';
import 'package:kk_chicken/features/cart/model/cart_model.dart';
import 'package:kk_chicken/features/cart/model/shiping_model.dart';
import 'package:kk_chicken/features/cart/repo/cart_repo.dart';
import 'package:kk_chicken/features/home/provider/home_provider.dart';
import 'package:kk_chicken/features/payment/view/payment_stat_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/fancy_snackbar/fancy_snackbar.dart';

class CartProvider extends ChangeNotifier {
  int totalPrice = 0;
  TextEditingController coupenController = TextEditingController();
  void addOneMoreFood(CartModel cartModel) {}
  final CartRepo _cartRepo = CartRepo();
  CartModel? cartModel;
  ShipingCost? shipingCost;
  String? coupenValue;
  int coupenPrice = 0;
  Future<void> getCartData({required BuildContext context}) async {
    try {
      EasyLoading.show();
      LoginSignupProvider loginProvider = context.read<LoginSignupProvider>();
      Map<String, dynamic> params = {
        "token": APIConst.TOKEN,
        "user_id": loginProvider.userModel!.userId.toString()
      };
      CartModel? cartModelAPI = await _cartRepo.getCart(context, params);
      if (cartModelAPI != null) {
        print("Cart Model: $cartModelAPI");
        cartModel = cartModelAPI;
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

  Future<void> getShipingCost({required BuildContext context}) async {
    try {
      print("TOtal Prize:: ${totalPrice}");
      LoginSignupProvider loginSignupProvider =
          context.read<LoginSignupProvider>();
      Map<String, dynamic> params = {
        APIConst.tokenKey: APIConst.TOKEN,
        "user_id": loginSignupProvider.userModel!.userId.toString(),
        "amount": totalPrice.toString()
      };
      ShipingCost? shipingCostAPI =
          await _cartRepo.getShipingCost(context, params);
      if (shipingCostAPI != null) {
        print("Shiping Model: $shipingCostAPI");
        shipingCost = shipingCostAPI;
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

  Future<void> clearCart({required BuildContext context}) async {
    try {
      HomeProvider homeProvider = context.read<HomeProvider>();
      Map<String, dynamic>? response = await _cartRepo.clearCartList(context);
      if (response != null) {
        totalPrice = 0;
        coupenPrice = 0;
        coupenValue = null;
        homeProvider.homeModel!.cartCount = 0;
        homeProvider.notifyListeners();
        cartModel!.cartData!.clear();
        Navigator.pop(context);
        notifyListeners();
        FancySnackbar.showSnackbar(context,
            snackBarType: FancySnackBarType.success,
            message: response['success']);
      }
    } catch (e) {
      EasyLoading.dismiss();
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> increasDescreasItemQuntity(
      {required BuildContext context,
      bool isIncrease = true,
      required int index,
      required CartData cartData}) async {
    try {
      Map<String, dynamic> params = {
        "token": APIConst.TOKEN,
        "cart_id": cartData.cartId.toString(),
        "itemid": cartData.itemid.toString(),
      };

      Map<String, dynamic>? response = await _cartRepo.increaseDecreaseItem(
        context,
        params: params,
        isIncrease: isIncrease,
      );
      if (response != null) {
        if (isIncrease) {
          cartData.itemquantity =
              (int.parse(cartData.itemquantity ?? '0') + 1).toString();
          cartData.totalPrice = ((int.parse(cartData.itemquantity ?? '0')) *
                  (int.parse(cartData.itemprice ?? '0')))
              .toDouble();
          totalPrice =
              ((int.parse(cartData.itemprice ?? "0")) + totalPrice).toInt();
          notifyListeners();
        } else {
          if (int.parse(cartData.itemquantity ?? '0') > 1) {
            cartData.itemquantity =
                (int.parse(cartData.itemquantity ?? '0') - 1).toString();
            cartData.totalPrice = ((int.parse(cartData.itemquantity ?? '0')) *
                (int.parse(cartData.itemprice ?? '0') + 0));
            totalPrice =
                (totalPrice - int.parse(cartData.itemprice ?? '0')).toInt();
          } else {
            HomeProvider homeProvider = context.read<HomeProvider>();
            cartData.totalPrice = 0.0;
            totalPrice = totalPrice - int.parse(cartData.itemprice ?? '0');
            homeProvider.homeModel!.cartCount =
                (homeProvider.homeModel!.cartCount ?? 1) - 1;
            homeProvider.notifyListeners();
            cartModel!.cartData!.removeAt(index);
          }
          notifyListeners();
        }
      }
      getShipingCost(context: context);
    } catch (e) {
      EasyLoading.dismiss();
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  void checkCoupenCode(BuildContext context) {
    if (shipingCost != null &&
        shipingCost!.coupons != null &&
        shipingCost!.coupons!.isNotEmpty) {
      int index = shipingCost!.coupons!.indexWhere(
          (element) => element.couponcode == coupenController.text.trim());
      if (index != -1) {
        if (totalPrice >= 100) {
          coupenValue = shipingCost!.coupons![index].couponcode;
          coupenPrice = int.parse(shipingCost!.coupons![index].rate ?? '0');

          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.success,
              message:
                  "Coupen Applied successfully... You Saved ${shipingCost!.coupons![index].rate}");
        } else {
          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.error,
              message: "Offer only applicabale for more then 100 rupees");
        }
      } else {
        FancySnackbar.showSnackbar(context,
            snackBarType: FancySnackBarType.error,
            message: "Invalid Coupen...");
      }
      notifyListeners();
    }
  }

  Future<void> placeOrder(BuildContext context, String paytmId) async {
    LoginSignupProvider loginSignupProvider =
        context.read<LoginSignupProvider>();
    AddressProvider addressProvider = context.read<AddressProvider>();
    Map<String, dynamic> params = {
      "user_id": loginSignupProvider.userModel!.userId.toString(),
      "token":
          "dfd65117f5a90cf87c1664e5f6db4d68b2d1e70e6bc2e96f9a5e40e995b0c066",
      "fname": loginSignupProvider.userModel!.fname,
      "city": addressProvider.cityController.text.trim(),
      "area": addressProvider.areaController.text.trim(),
      "mobile": addressProvider.mobileController.text.trim(),
      "address": addressProvider.addressController.text.trim(),
      "coupon": coupenValue,
      "couponprice": coupenPrice.toString(),
      "ptype": "Online Payment",
      "payid": paytmId,
      "dtype": "Online Payment",
      "lat": loginSignupProvider.lat.toString(),
      "lng": loginSignupProvider.long.toString(),
      "total": totalPrice.toString(),
      "shipping": shipingCost!.shipCost.toString(),
      "deliverytime": addressProvider.deliveryDate.text.trim() +
          addressProvider.deliveryTimeSlot.text,
      "items": List.generate(cartModel!.cartData!.length, (index) {
        if (cartModel!.cartData![index].itemquantity == "1") {
          cartModel!.cartData![index].itemtotal =
              cartModel!.cartData![index].itemprice;
        }
        return {
          "itemname": cartModel!.cartData![index].itemname,
          "itemquantity": cartModel!.cartData![index].itemquantity,
          "itemquantitytype": cartModel!.cartData![index].itemquantitytype,
          "itemprice": cartModel!.cartData![index].itemprice,
          "itemtotal": cartModel!.cartData![index].itemtotal,
          "Mquantity": cartModel!.cartData![index].mquantity
        };
      })
    };

    try {
      EasyLoading.show();

      Map<String, dynamic>? response =
          await _cartRepo.placeOrder(context, params);
      if (response != null) {
        totalPrice = 0;

        coupenValue = null;
        coupenPrice = 0;
        EasyLoading.dismiss();
        notifyListeners();
        // FancySnackbar.showSnackbar(context,
        //     snackBarType: FancySnackBarType.success,
        //     message: "Order Placed Successfully");
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return PaymentStatScreen(orderId: response['data']);
          },
        ));
        // context.router.push(PaymentStatScreenRoute(orderId: response['data']));
        clearCart(context: context);
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
