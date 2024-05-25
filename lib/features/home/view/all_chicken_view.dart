// ignore_for_file: use_build_context_synchronously

// import 'package:auto_route/auto_route.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kk_chicken/config/config.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/cart/provider/cart_provider.dart';
import 'package:kk_chicken/features/cart/view/cart_screen.dart';
import 'package:kk_chicken/features/home/provider/home_provider.dart';
import 'package:kk_chicken/features/home/view/food_detail_screen.dart';
import 'package:provider/provider.dart';

import '../model/home_model.dart';
import '../widget/chicken_food_card.dart';

// @RoutePage()
class AllChickenView extends StatelessWidget {
  final String categoryName;
  final List<HomeData> chikenList;
  const AllChickenView(
      {super.key, required this.chikenList, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: categoryName,
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
      body: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        return Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            if (chikenList.isNotEmpty) ...{
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: chikenList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return ChickenFoodCard(
                      chickenFoodModel: chikenList[index],
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return FoodDetailScreen(
                                chickenFoodModel: chikenList[index]);
                          },
                        ));
                        // context.router.push(FoodDetailScreenRoute(
                        //     chickenFoodModel: chikenList[index]));
                      },
                      onAddTap: () {
                        homeProvider.addProductToCart(
                            context, chikenList[index]);
                      },
                    );
                  },
                ),
              )
            } else ...{
              Expanded(
                  child: Center(
                child: Text(
                  "No $categoryName Found",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ))
            }
          ],
        );
      }),
    );
  }
}
