// import 'package:auto_route/auto_route.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kk_chicken/core/consts/shared_preference_key.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/core/widgets/fancy_snackbar/fancy_snackbar.dart';
import 'package:kk_chicken/features/address/provider/address_provider.dart';
import 'package:kk_chicken/features/cart/provider/cart_provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../authentication/login_signup/provider/login_signup_provider.dart';

// @RoutePage()
class FillAddressScreen extends StatefulWidget {
  const FillAddressScreen({super.key});

  @override
  State<FillAddressScreen> createState() => _FillAddressScreenState();
}

class _FillAddressScreenState extends State<FillAddressScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Razorpay razorpay;
  late CartProvider cartProvider;
  late AddressProvider addressProvider;
  @override
  void initState() {
    print("Init Called");
    cartProvider = context.read<CartProvider>();
    addressProvider = context.read<AddressProvider>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      addressProvider.addressModel = await SharedPref.getUserAddress();
      if (addressProvider.addressModel != null) {
        addressProvider.fullNameController.text =
            addressProvider.addressModel!.fullName ?? '';
        addressProvider.cityController.text =
            addressProvider.addressModel!.city ?? '';
        addressProvider.areaController.text =
            addressProvider.addressModel!.area ?? '';
        addressProvider.addressController.text =
            addressProvider.addressModel!.address ?? '';
        addressProvider.mobileController.text =
            addressProvider.addressModel!.mobile ?? '';
      } else {
        addressProvider.getUserCurrentLocation(
          context: context,
        );
      }

      addressProvider.getAreaList(
        context: context,
      );
      addressProvider.getDeliveryTimeSlot(context: context);
    });
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, errorHandler);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, successHandler);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWalletHandler);
    super.initState();
  }

  void errorHandler(PaymentFailureResponse response) {
    FancySnackbar.showSnackbar(context,
        snackBarType: FancySnackBarType.error, message: response.message ?? '');
  }

  void successHandler(PaymentSuccessResponse response) {
    if (response.paymentId != null) {
      cartProvider.placeOrder(context, response.paymentId ?? '');
    }
  }

  void externalWalletHandler(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.walletName!),
      backgroundColor: Colors.green,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Fill Delivery Details",
        context: context,
        actions: [
          Bounce(
            duration: const Duration(milliseconds: 150),
            onTap: () {},
            child: const Icon(
              Icons.share,
              color: ColorTheme.whiteColor,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
      body: SafeArea(
          child: Form(
        key: formKey,
        child: Column(
          children: [
            Consumer<AddressProvider>(
                builder: (context, addressProvider, child) {
              return Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        isBorderVisible: true,
                        controller: addressProvider.fullNameController,
                        labelText: "Full Name",
                        labelTextColor: ColorTheme.blackColor,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Name can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        isBorderVisible: true,
                        initialValue: "Banglore",
                        labelText: "City",
                        onTap: () {},
                        labelTextColor: ColorTheme.blackColor,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "City can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        isBorderVisible: true,
                        controller: addressProvider.areaController,
                        labelText: "Area",
                        labelTextColor: ColorTheme.blackColor,
                        suffixIcon: const Icon(
                          Icons.arrow_drop_down,
                          color: ColorTheme.darkGrey,
                        ),
                        onTap: () {
                          List<String> areas = [];
                          addressProvider.areaList.forEach((element) {
                            if (element.city != null) {
                              areas.add(element.city ?? '');
                            }
                          });
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ItemPickerDiolog(
                                  selectedValue:
                                      addressProvider.areaController.text,
                                  dialogTitle: "Area",
                                  itemList: areas,
                                  onTap: (String value) {
                                    addressProvider.areaController.text = value;
                                  });
                            },
                          );
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Area can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        isBorderVisible: true,
                        controller: addressProvider.addressController,
                        labelText: "Address",
                        labelTextColor: ColorTheme.blackColor,
                        maxLine: 4,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Address can't be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        isBorderVisible: true,
                        controller: addressProvider.mobileController,
                        labelText: "Mobile",
                        textInputType: TextInputType.phone,
                        inputFormatters: [
                          MaskTextInputFormatter(
                              mask: '##########',
                              filter: {"#": RegExp(r'[0-9]')},
                              type: MaskAutoCompletionType.lazy)
                        ],
                        labelTextColor: ColorTheme.blackColor,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Mobile can't be empty";
                          } else if (value.trim().length != 10) {
                            return "Mobile number length must be 10 digit long";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        isBorderVisible: true,
                        controller: addressProvider.deliveryDate,
                        labelText: "Delivry Date",
                        labelTextColor: ColorTheme.blackColor,
                        validator: (value) {
                          if (value == null ||
                              value.toString().trim().isEmpty) {
                            return "Please choose date";
                          }
                          return null;
                        },
                        onTap: () async {
                          DateTime? dateTime = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 90)));
                          if (dateTime != null) {
                            addressProvider.deliveryDate.text =
                                DateFormat('dd-MM-yyyy').format(dateTime);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        isBorderVisible: true,
                        controller: addressProvider.deliveryTimeSlot,
                        labelText: "Delivry Time Slot",
                        labelTextColor: ColorTheme.blackColor,
                        validator: (value) {
                          if (value == null ||
                              value.toString().trim().isEmpty) {
                            return "Please choose delivery times slot";
                          }
                          return null;
                        },
                        suffixIcon: const Icon(
                          Icons.arrow_drop_down,
                          color: ColorTheme.darkGrey,
                        ),
                        onTap: () async {
                          List<String> timeSlots = [];
                          addressProvider.timeslots.forEach((element) {
                            if (element.slot != null) {
                              timeSlots.add(element.slot ?? '');
                            }
                          });
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ItemPickerDiolog(
                                  dialogTitle: "Delivery Time Slot",
                                  selectedValue:
                                      addressProvider.deliveryTimeSlot.text,
                                  itemList: timeSlots,
                                  onTap: (String value) {
                                    addressProvider.deliveryTimeSlot.text =
                                        value;
                                  });
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            }),
            Consumer<AddressProvider>(
                builder: (context, addressProvider, child) {
              return Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                return GestureDetector(
                  onTap: () {
                    LoginSignupProvider loginSignupProvider =
                        context.read<LoginSignupProvider>();
                    if (formKey.currentState!.validate()) {
                      addressProvider.openCheckout(
                          "${cartProvider.totalPrice + (cartProvider.shipingCost!.shipCost ?? 0) - cartProvider.coupenPrice}",
                          razorpay,
                          loginSignupProvider.userModel!.mobile ?? '',
                          (loginSignupProvider.userModel!.email ?? ''),
                          context);
                    }
                  },
                  child: Container(
                    height: 56.hPr(context),
                    width: double.maxFinite,
                    decoration: const BoxDecoration(color: ColorTheme.orange),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Text(
                            'Processed to Buy : ₹${cartProvider.totalPrice + (cartProvider.shipingCost!.shipCost ?? 0)} ',
                            style: FontUtilities.style(
                                fontSize: 16,
                                fontWeight: FWT.semiBold,
                                fontColor: ColorTheme.whiteColor),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: ColorTheme.whiteColor,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                );
              });
            })
          ],
        ),
      )),
    );
  }
}
