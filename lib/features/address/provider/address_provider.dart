// ignore_for_file: use_build_context_synchronously

// import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:kk_chicken/core/consts/api_const.dart';
import 'package:kk_chicken/core/consts/shared_preference_key.dart';
import 'package:kk_chicken/features/address/model/address_model.dart';
import 'package:kk_chicken/features/address/model/area_model.dart';
import 'package:kk_chicken/features/address/model/time_slot_model.dart';
import 'package:kk_chicken/features/address/repo/address_repo.dart';
import 'package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../core/widgets/fancy_snackbar/fancy_snackbar.dart';

class AddressProvider extends ChangeNotifier {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController deliveryDate = TextEditingController();
  final TextEditingController deliveryTimeSlot = TextEditingController();
  bool isSearviceAvailableInArea = true;
  final AddressRepo _addressRepo = AddressRepo();
  List<Areas> areaList = [];
  List<Timeslots> timeslots = [];
  AddressModel? addressModel;
  void openCheckout(String amount, Razorpay razorpay, String mobile,
      String email, BuildContext context) {
    addressModel = AddressModel(
        id: addressModel?.id,
        fullName: fullNameController.text.trim(),
        city: cityController.text.trim(),
        area: areaController.text.trim(),
        address: addressController.text.trim(),
        mobile: mobileController.text.trim());

    SharedPref.storeUserAddress(addressModel!);

    if (isSearviceAvailableInArea) {
      var options = {
        "key": APIConst.RAZORPAY_KEY,
        "amount": int.parse(amount) * 100,
        "name": "KK Chicken",
        "description": "This payment for your order",
        "timeout": "180",
        "currency": "INR",
        "prefill": {
          "contact": "+91$mobile",
          "email": email,
        }
      };
      razorpay.open(options);
    } else {
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error,
          message: "Service not available on your area..");
    }
  }

  Future<void> getAreaList({
    required BuildContext context,
  }) async {
    try {
      EasyLoading.show();
      LoginSignupProvider loginSignupProvider =
          context.read<LoginSignupProvider>();
      Map<String, dynamic> params = {
        "token": APIConst.TOKEN,
        "user_lat": loginSignupProvider.lat.toString(),
        "user_lng": loginSignupProvider.long.toString()
        // "user_lat": (12.88185773783186).toString(),
        // "user_lng": (77.58528970195174).toString()
      };
      AreaModel? areaModelAPI = await _addressRepo.getAreaList(context, params);
      if (areaModelAPI != null) {
        areaList = areaModelAPI.areas ?? [];
        if (areaModelAPI.deliveryAvailable == "NO") {
          isSearviceAvailableInArea = false;
          FancySnackbar.showSnackbar(context,
              snackBarType: FancySnackBarType.error,
              message:
                  "Currently service is not available in your area..Service will be available in your area soon");
          Navigator.pop(context);
        } else {
          isSearviceAvailableInArea = true;
        }
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

  Future<void> getUserCurrentLocation({
    required BuildContext context,
  }) async {
    try {
      LoginSignupProvider loginSignupProvider =
          context.read<LoginSignupProvider>();
      Map<String, dynamic> params = {
        "token": APIConst.TOKEN,
        "latitude": loginSignupProvider.lat.toString(),
        "longitude": loginSignupProvider.long.toString()
      };
      String? userAddress =
          await _addressRepo.getUserCurrentLocation(context, params);
      if (userAddress != null) {
        addressController.text = userAddress;
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

  Future<void> getDeliveryTimeSlot({required BuildContext context}) async {
    try {
      EasyLoading.show();

      notifyListeners();
      TimeSlotModel? timeSlotModel =
          await _addressRepo.getDeliveryTimeSlot(context);
      if (timeSlotModel != null) {
        timeslots = timeSlotModel.timeslots ?? [];
        notifyListeners();
      }
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
