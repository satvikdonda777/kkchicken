// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, use_build_context_synchronously

// import 'package:auto_route/auto_route.dart';
import 'package:bounce/bounce.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kk_chicken/core/consts/api_const.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/cart/provider/cart_provider.dart';
import 'package:kk_chicken/features/home/model/home_model.dart';
import 'package:kk_chicken/features/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../config/navigation.dart/app_route.dart';
import '../../cart/view/cart_screen.dart';

// @RoutePage()
class FoodDetailScreen extends StatefulWidget {
  final HomeData chickenFoodModel;
  const FoodDetailScreen({super.key, required this.chickenFoodModel});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Chicken",
        context: context,
        actions: [
          Consumer<CartProvider>(builder: (context, cartProvider, child) {
            return Bounce(
              duration: const Duration(milliseconds: 150),
              onTap: () async {
                await cartProvider.getCartData(context: context);
                await cartProvider.getShipingCost(context: context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CartScreen();
                  },
                ));
                // context.router.push(const CartScreenRoute());
              },
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 5),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        SvgPicture.asset(
                          AppImage.shop,
                          height: 30.hPr(context),
                          width: 30.wPr(context),
                        ),
                      ],
                    ),
                  ),
                  Consumer<HomeProvider>(
                      builder: (context, homeProvider, child) {
                    return Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0, right: 15),
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: ColorTheme.red),
                          child: Center(
                              child: Text(
                            (homeProvider.homeModel!.cartCount ?? 0).toString(),
                            style: FontUtilities.style(
                                fontSize: 10,
                                fontColor: ColorTheme.whiteColor,
                                fontWeight: FWT.medium),
                          )),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200.hPr(context),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: CachedNetworkImageProvider(
                              "${APIConst.IMAGE_URL}${widget.chickenFoodModel.thumbnail ?? ''}")),
                    ),
                  ),
                  if (widget.chickenFoodModel.offer == "YES")
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 25,
                        width: 70,
                        margin: const EdgeInsets.only(left: 2, top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorTheme.orange,
                        ),
                        child: Center(
                          child: Text(
                            "${(int.parse(widget.chickenFoodModel.price ?? '0') * 100) / int.parse(widget.chickenFoodModel.mrp ?? '0')}% OFF",
                            style: FontUtilities.style(
                                fontSize: 12,
                                fontWeight: FWT.semiBold,
                                fontColor: ColorTheme.whiteColor),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                widget.chickenFoodModel.name ?? '',
                style:
                    FontUtilities.style(fontSize: 16, fontWeight: FWT.semiBold),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.chickenFoodModel.offer == "YES"
                        ? "₹${widget.chickenFoodModel.price.toString()}"
                        : "₹${widget.chickenFoodModel.mrp.toString()}",
                    style: FontUtilities.style(
                        fontSize: 16, fontWeight: FWT.semiBold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  if (widget.chickenFoodModel.offer == "YES")
                    Text(
                      "₹${widget.chickenFoodModel.price.toString()}",
                      style: FontUtilities.style(
                          fontSize: 16,
                          fontWeight: FWT.semiBold,
                          fontColor: ColorTheme.darkGrey,
                          decoration: TextDecoration.lineThrough),
                    ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    "/",
                    style: FontUtilities.style(
                        fontSize: 16, fontWeight: FWT.semiBold),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    widget.chickenFoodModel.quantity.toString(),
                    style: FontUtilities.style(
                      fontSize: 16,
                      fontWeight: FWT.semiBold,
                      fontColor: ColorTheme.blackColor,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Bounce(
                    duration: const Duration(milliseconds: 150),
                    onTap: () {
                      if ((widget.chickenFoodModel.qnt ?? 1) > 0) {
                        widget.chickenFoodModel.qnt =
                            (widget.chickenFoodModel.qnt ?? 1) - 1;
                        homeProvider.notifyListeners();
                      }
                    },
                    child: Container(
                      height: 30.hPr(context),
                      width: 30.wPr(context),
                      decoration: BoxDecoration(
                        color: ColorTheme.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.remove,
                          color: ColorTheme.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    height: 30.hPr(context),
                    width: 30.wPr(context),
                    decoration: BoxDecoration(
                      color: ColorTheme.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        (widget.chickenFoodModel.qnt ?? 1).toString(),
                        style: FontUtilities.style(
                            fontSize: 12,
                            fontColor: ColorTheme.whiteColor,
                            fontWeight: FWT.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Bounce(
                    duration: const Duration(milliseconds: 150),
                    onTap: () {
                      if (int.parse(widget.chickenFoodModel.stockqty ?? '0') >
                          (widget.chickenFoodModel.qnt ?? 1)) {
                        widget.chickenFoodModel.qnt =
                            (widget.chickenFoodModel.qnt ?? 1) + 1;
                        homeProvider.notifyListeners();
                      }
                    },
                    child: Container(
                      height: 30.hPr(context),
                      width: 30.wPr(context),
                      decoration: BoxDecoration(
                        color: ColorTheme.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: ColorTheme.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                widget.chickenFoodModel.description ?? '',
                style:
                    FontUtilities.style(fontSize: 14, fontWeight: FWT.medium),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Visibility(
                  visible: widget.chickenFoodModel.qnt != 0,
                  child: CustomFlatButton(
                      onPressed: () async {
                        EasyLoading.show();
                        await homeProvider.addProductToCart(
                            context, widget.chickenFoodModel);
                        EasyLoading.dismiss();
                        Navigator.pop(context);
                      },
                      title: "ADD TO CART")),
              SizedBox(
                height: 20.hPr(context),
              )
            ],
          );
        }),
      ),
    );
  }
}
