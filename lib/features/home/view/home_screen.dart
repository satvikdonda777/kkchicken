// ignore_for_file: use_build_context_synchronously, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

// import 'package:auto_route/auto_route.dart';
import 'package:bounce/bounce.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kk_chicken/config/config.dart';
import 'package:kk_chicken/core/cached_image/cached_image_widget.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/cart/provider/cart_provider.dart';
import 'package:kk_chicken/features/category/provider/category_provider.dart';
import 'package:kk_chicken/features/category/view/category_screen.dart';
import 'package:kk_chicken/features/home/model/home_model.dart';
import 'package:kk_chicken/features/home/provider/home_provider.dart';
import 'package:kk_chicken/features/home/view/all_chicken_view.dart';
import 'package:kk_chicken/features/home/view/all_food_view.dart';
import 'package:kk_chicken/features/home/view/food_detail_screen.dart';
import 'package:kk_chicken/features/home/view/offer_product_view.dart';
import 'package:kk_chicken/features/home/widget/chicken_food_card.dart';
import 'package:kk_chicken/features/home/widget/drawer_widget.dart';
import 'package:provider/provider.dart';

import '../../cart/view/cart_screen.dart';

// @RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late HomeProvider home;
  late CategoryProvider categoryProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      home = context.read<HomeProvider>();
      categoryProvider = context.read<CategoryProvider>();
      home.isLoading = true;
      home.notifyListeners();
      await home.getHomeData(context: context);
      await categoryProvider.getCategoryList(context: context);
      home.isLoading = false;
      home.notifyListeners();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(
          title: "KKChickens",
          context: context,
          leading:
              Consumer<HomeProvider>(builder: (context, homeProvider, child) {
            return Bounce(
              duration: const Duration(milliseconds: 150),
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: SvgPicture.asset(
                    AppImage.menu,
                    height: 15,
                    width: 15,
                  ),
                ),
              ),
            );
          }),
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
                              (homeProvider.homeModel?.cartCount ?? 0)
                                  .toString(),
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
          bottomWidget: PreferredSize(
              preferredSize: const Size(double.maxFinite, 80),
              child: Column(
                children: [
                  Consumer<HomeProvider>(
                      builder: (context, homeProvider, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: CustomSearchField(
                        hintText: "Search Products...",
                        onChange: (String? value) {
                          homeProvider.searchProduct(value ?? '');
                          return null;
                        },
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ))),
      drawer: DrawerWidget(
        homeContext: context,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Consumer<HomeProvider>(builder: (context, homeProvider, child) {
            if (homeProvider.isLoading) {
              return const SizedBox.shrink();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                if (homeProvider.isSearch) ...{
                  Container(
                      color: ColorTheme.whiteColor,
                      child: Column(
                        children: [
                          if (homeProvider.searchedList.isNotEmpty) ...{
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: homeProvider.searchedList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.5,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemBuilder: (context, index) {
                                  return ChickenFoodCard(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return FoodDetailScreen(
                                            chickenFoodModel: homeProvider
                                                .searchedList[index],
                                          );
                                        },
                                      ));
                                      // context.router.push(FoodDetailScreenRoute(
                                      //     chickenFoodModel: homeProvider
                                      //         .searchedList[index]));
                                    },
                                    chickenFoodModel:
                                        homeProvider.searchedList[index],
                                    onAddTap: () {
                                      homeProvider.addProductToCart(context,
                                          homeProvider.searchedList[index]);
                                    },
                                  );
                                },
                              ),
                            )
                          } else ...{
                            const Center(
                              child: Text("No Data Found"),
                            )
                          },
                        ],
                      ))
                } else ...{
                  Consumer<HomeProvider>(
                      builder: (context, homeProvider, child) {
                    if (homeProvider.homeModel == null ||
                        homeProvider.homeModel!.bannData == null &&
                            homeProvider.homeModel!.bannData!.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                              viewportFraction: 1,
                              height: 120.0.hPr(context),
                              autoPlay: true,
                              onPageChanged: (index, reason) {
                                homeProvider.onAdChange(index);
                              },
                              autoPlayInterval: const Duration(seconds: 5)),
                          items: homeProvider.homeModel!.bannData!.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Bounce(
                                  onTap: () async {
                                    await homeProvider.getOfferProduct(
                                        context: context);
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const OfferProductView();
                                      },
                                    ));
                                    // context.router
                                    //     .push(const OfferProductViewRoute());
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 14),
                                    color: Colors.yellow,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: CachedImageWidget(
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        imageUrl: i.bnimg ?? '',
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              homeProvider.homeModel!.bannData!.length,
                              (index) {
                            return Container(
                              height: 10,
                              width: 10,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: homeProvider.currentAdsIndex == index
                                      ? ColorTheme.orange
                                      : ColorTheme.darkGrey),
                            );
                          }),
                        )
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shop By Category",
                              style: FontUtilities.style(
                                  fontSize: 16, fontWeight: FWT.semiBold),
                            ),
                            Bounce(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const CategoryScreen();
                                  },
                                ));
                                // context.router
                                //     .push(const CategoryScreenRoute());
                              },
                              duration: const Duration(milliseconds: 150),
                              child: Text(
                                "View All",
                                style: FontUtilities.style(
                                    fontColor: ColorTheme.orange,
                                    fontSize: 14,
                                    fontWeight: FWT.semiBold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        homeProvider.homeModel != null &&
                                homeProvider.homeModel!.cateData != null &&
                                homeProvider.homeModel!.cateData!.isNotEmpty
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                    children: List.generate(
                                        homeProvider
                                            .homeModel!.cateData!.length,
                                        (index) => Bounce(
                                              duration: const Duration(
                                                  milliseconds: 100),
                                              onTap: () {
                                                List<HomeData> tempChickenList =
                                                    [];
                                                tempChickenList.addAll(
                                                    homeProvider.chikenList);
                                                tempChickenList.addAll(
                                                    homeProvider.foodList);
                                                List<HomeData> productList =
                                                    tempChickenList
                                                        .where((element) =>
                                                            element.category ==
                                                            categoryProvider
                                                                .categoryList[
                                                                    index]
                                                                .id
                                                                .toString())
                                                        .toList();
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return AllChickenView(
                                                        chikenList: productList,
                                                        categoryName:
                                                            homeProvider
                                                                    .homeModel!
                                                                    .cateData![
                                                                        index]
                                                                    .cname ??
                                                                '');
                                                  },
                                                ));
                                                // context.router.push(
                                                //     AllChickenViewRoute(
                                                //         chikenList: productList,
                                                //         categoryName:
                                                //             homeProvider
                                                //                     .homeModel!
                                                //                     .cateData![
                                                //                         index]
                                                //                     .cname ??
                                                //                 ''
                                                // ));
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12),
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 10,
                                                                spreadRadius: 1,
                                                                color: ColorTheme
                                                                    .darkGrey
                                                                    .withOpacity(
                                                                        0.3),
                                                              )
                                                            ]),
                                                        child: CachedImageWidget(
                                                            imageUrl: homeProvider
                                                                    .homeModel!
                                                                    .cateData![
                                                                        index]
                                                                    .thumbnail ??
                                                                '',
                                                            fit: BoxFit.cover,
                                                            height: 100,
                                                            width: 100)),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    homeProvider
                                                            .homeModel!
                                                            .cateData![index]
                                                            .cname ??
                                                        '',
                                                    style: FontUtilities.style(
                                                        fontSize: 14,
                                                        fontWeight: FWT.medium),
                                                  )
                                                ],
                                              ),
                                            ))),
                              )
                            : const Center(
                                child: Text(
                                  "No Category Found",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Chicken",
                              style: FontUtilities.style(
                                  fontSize: 16, fontWeight: FWT.semiBold),
                            ),
                            Bounce(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return AllChickenView(
                                        chikenList: homeProvider.chikenList,
                                        categoryName: "Chicken");
                                  },
                                ));
                                // context.router.push(AllChickenViewRoute(
                                //     categoryName: "Chiken",
                                //     chikenList: homeProvider.chikenList));
                              },
                              duration: const Duration(milliseconds: 150),
                              child: Text(
                                "View All",
                                style: FontUtilities.style(
                                    fontColor: ColorTheme.orange,
                                    fontSize: 14,
                                    fontWeight: FWT.semiBold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        if (homeProvider.chikenList.isNotEmpty) ...{
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: homeProvider.chikenList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.5,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              return ChickenFoodCard(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return FoodDetailScreen(
                                        chickenFoodModel:
                                            homeProvider.chikenList[index],
                                      );
                                    },
                                  ));
                                  // context.router.push(FoodDetailScreenRoute(
                                  //     chickenFoodModel:
                                  //         homeProvider.chikenList[index]));
                                },
                                chickenFoodModel:
                                    homeProvider.chikenList[index],
                                onAddTap: () {
                                  homeProvider.addProductToCart(
                                      context, homeProvider.chikenList[index]);
                                },
                              );
                            },
                          ),
                        } else ...{
                          const Center(
                            child: Text("No Chiken Found"),
                          )
                        },
                        const SizedBox(
                          height: 12,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Food",
                              style: FontUtilities.style(
                                  fontSize: 16, fontWeight: FWT.semiBold),
                            ),
                            Bounce(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const AllFoodScreen();
                                  },
                                ));
                                // context.router.push(const AllFoodScreenRoute());
                              },
                              duration: const Duration(milliseconds: 150),
                              child: Text(
                                "View All",
                                style: FontUtilities.style(
                                    fontColor: ColorTheme.orange,
                                    fontSize: 14,
                                    fontWeight: FWT.semiBold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        if (homeProvider.foodList.isNotEmpty) ...{
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: homeProvider.foodList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.5,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              return ChickenFoodCard(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return FoodDetailScreen(
                                          chickenFoodModel:
                                              homeProvider.foodList[index]);
                                    },
                                  ));
                                  // context.router.push(FoodDetailScreenRoute(
                                  //     chickenFoodModel:
                                  //         homeProvider.foodList[index]));
                                },
                                chickenFoodModel: homeProvider.foodList[index],
                                onAddTap: () {
                                  homeProvider.addProductToCart(
                                      context, homeProvider.foodList[index]);
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        } else ...{
                          const Center(
                            child: Text(
                              "No Food Found",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )
                        }
                      ],
                    ),
                  ),
                }
              ],
            );
          }),
        ),
      ),
    );
  }
}
