// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

// import 'package:auto_route/auto_route.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kk_chicken/config/navigation.dart/app_route.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/address/view/fill_address_screen.dart';
import 'package:kk_chicken/features/cart/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_card_widget.dart';

// @RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartProvider cartProvider;
  @override
  void initState() {
    cartProvider = context.read<CartProvider>();
    cartProvider.totalPrice = 0;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      for (var element in cartProvider.cartModel!.cartData!) {
        cartProvider.totalPrice = (int.parse(element.itemprice ?? '0') *
                    int.parse(element.itemquantity ?? "1") +
                cartProvider.totalPrice)
            .toInt();
        cartProvider.notifyListeners();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "My Cart", context: context, actions: [
        Consumer<CartProvider>(builder: (context, cartProvider, child) {
          return Bounce(
            duration: const Duration(milliseconds: 150),
            onTap: () async {
              showDialog(
                context: context,
                builder: (mainContext) {
                  return ConfirmationDiolog(
                      buttonText: "Delete",
                      confirmText: "Are you sure want to clear your cart.??",
                      onTap: () async {
                        // mainContext.router.pop();
                        Navigator.pop(mainContext);
                        EasyLoading.show();
                        await cartProvider.clearCart(context: context);
                      },
                      sureText: "Clear Cart..??");
                },
              );
            },
            child: const Icon(
              CupertinoIcons.delete,
              color: ColorTheme.whiteColor,
            ),
          );
        }),
        const SizedBox(
          width: 12,
        )
      ]),
      body: SafeArea(
        child: Consumer<CartProvider>(builder: (context, cartProvider, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sub Total",
                              style: FontUtilities.style(
                                  fontSize: 14, fontWeight: FWT.medium),
                            ),
                            Text(
                              "₹${cartProvider.totalPrice}",
                              style: FontUtilities.style(
                                  fontSize: 14, fontWeight: FWT.medium),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shiping Cost",
                              style: FontUtilities.style(
                                  fontSize: 14, fontWeight: FWT.medium),
                            ),
                            Text(
                              "₹${cartProvider.shipingCost?.shipCost}",
                              style: FontUtilities.style(
                                  fontSize: 14,
                                  fontWeight: FWT.medium,
                                  fontColor: ColorTheme.red),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        if (cartProvider.coupenValue != null) ...{
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "You Saved",
                                style: FontUtilities.style(
                                    fontSize: 14,
                                    fontWeight: FWT.medium,
                                    fontColor: ColorTheme.green),
                              ),
                              Text(
                                "₹${cartProvider.coupenPrice}",
                                style: FontUtilities.style(
                                    fontSize: 14,
                                    fontWeight: FWT.medium,
                                    fontColor: ColorTheme.green),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        },
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " Total  ",
                              style: FontUtilities.style(
                                  fontSize: 14, fontWeight: FWT.medium),
                            ),
                            Text(
                              "₹${cartProvider.totalPrice + (cartProvider.shipingCost?.shipCost ?? 0) - cartProvider.coupenPrice}",
                              style: FontUtilities.style(
                                  fontSize: 14,
                                  fontWeight: FWT.medium,
                                  fontColor: ColorTheme.red),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Consumer<CartProvider>(
                            builder: (context, cartProvider, child) {
                          return Row(
                            children: [
                              Expanded(
                                  child: CustomTextField(
                                controller: cartProvider.coupenController,
                                isBorderVisible: true,
                              )),
                              const SizedBox(
                                width: 12,
                              ),
                              CustomFlatButton(
                                onPressed: () {
                                  cartProvider.checkCoupenCode(context);
                                },
                                title: "Apply",
                              )
                            ],
                          );
                        }),
                        const SizedBox(
                          height: 12,
                        ),
                        const Divider(
                          color: ColorTheme.darkGrey,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        if (cartProvider.cartModel != null &&
                            cartProvider.cartModel!.cartData != null &&
                            cartProvider.cartModel!.cartData!.isNotEmpty) ...{
                          ListView.separated(
                            separatorBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Divider(
                                  color: ColorTheme.darkGrey,
                                ),
                              );
                            },
                            itemCount: cartProvider.cartModel!.cartData!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CartCardWidget(
                                cartModel:
                                    cartProvider.cartModel!.cartData![index],
                                onAdd: () {
                                  cartProvider.increasDescreasItemQuntity(
                                      context: context,
                                      index: index,
                                      cartData: cartProvider
                                          .cartModel!.cartData![index],
                                      isIncrease: true);
                                },
                                onRemove: () {
                                  cartProvider.increasDescreasItemQuntity(
                                      context: context,
                                      index: index,
                                      cartData: cartProvider
                                          .cartModel!.cartData![index],
                                      isIncrease: false);
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        } else ...{
                          const Center(
                            child: Text("No cart data found"),
                          )
                        }
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const FillAddressScreen();
                    },
                  ));
                  // context.router.push(const FillAddressScreenRoute());
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
                          'Processed to Buy : ₹${cartProvider.totalPrice + (cartProvider.shipingCost?.shipCost ?? 0) - cartProvider.coupenPrice} ',
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
              )
            ],
          );
        }),
      ),
    );
  }
}
