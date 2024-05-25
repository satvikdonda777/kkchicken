// ignore_for_file: use_build_context_synchronously

// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kk_chicken/config/config.dart';
import 'package:kk_chicken/features/app_document/view/app_document_screen.dart';
import 'package:kk_chicken/features/authentication/login_signup/view/login_signup.dart';
import 'package:kk_chicken/features/category/view/category_screen.dart';
import 'package:kk_chicken/features/home/view/offer_product_view.dart';
import 'package:kk_chicken/features/profile/view/profile_screen.dart';
import 'package:provider/provider.dart';

import 'package:kk_chicken/config/navigation.dart/app_route.dart';
import 'package:kk_chicken/core/consts/shared_preference_key.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart';
import 'package:kk_chicken/features/home/data/home_data.dart';
import 'package:kk_chicken/features/home/provider/home_provider.dart';

import '../../order/provider/order_provider.dart';

class DrawerWidget extends StatelessWidget {
  final BuildContext homeContext;
  const DrawerWidget({super.key, required this.homeContext});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Consumer<LoginSignupProvider>(
                builder: (context, loginSignUpProvider, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Hi ${loginSignUpProvider.userModel!.fname}, Welcome to KKChicken",
                  style: FontUtilities.style(fontSize: 16),
                ),
              );
            }),
            const SizedBox(
              height: 8,
            ),
            const Divider(),
            Consumer<HomeProvider>(builder: (context, homeProvider, child) {
              return Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () async {
                          HomeProvider homeProvider =
                              homeContext.read<HomeProvider>();
                          Navigator.pop(context);

                          if (index == 0) {
                            OrderProvider orderProvider =
                                homeContext.read<OrderProvider>();

                            await orderProvider.getMyOrder(
                                context: homeContext);
                          } else if (index == 2) {
                            Navigator.push(homeContext, MaterialPageRoute(
                              builder: (context) {
                                return const CategoryScreen();
                              },
                            ));
                            // homeContext.router
                            //     .push(const CategoryScreenRoute());
                          } else if (index == 3) {
                            await homeProvider.getOfferProduct(
                                context: context);
                            Navigator.push(homeContext, MaterialPageRoute(
                              builder: (context) {
                                return const OfferProductView();
                              },
                            ));
                            // homeContext.router
                            //     .push(const OfferProductViewRoute());
                          } else if (index == 4) {
                            Navigator.push(homeContext, MaterialPageRoute(
                              builder: (context) {
                                return const ProfileScreen();
                              },
                            ));
                            // homeContext.router.push(const ProfileScreenRoute());
                          } else if (index == 5) {
                            Navigator.push(homeContext, MaterialPageRoute(
                              builder: (context) {
                                return AppDocumentScreen(
                                  docType: drawerData[index]['title'],
                                );
                              },
                            ));
                            // homeContext.router.push(AppDocumentScreenRoute(
                            //     docType: drawerData[index]['title']));
                          } else if (index == 6) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return AppDocumentScreen(
                                    docType: drawerData[index]['title']);
                              },
                            ));
                            // homeContext.router.push(AppDocumentScreenRoute(
                            //     docType: drawerData[index]['title']));
                          } else if (index == 7) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return AppDocumentScreen(
                                    docType: drawerData[index]['title']);
                              },
                            ));
                            // homeContext.router.push(AppDocumentScreenRoute(
                            //     docType: drawerData[index]['title']));
                          } else if (index == 8) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return AppDocumentScreen(
                                    docType: drawerData[index]['title']);
                              },
                            ));
                            // homeContext.router.push(AppDocumentScreenRoute(
                            //     docType: drawerData[index]['title']));
                          }
                        },
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        leading: SvgPicture.asset(
                          drawerData[index]['icon'],
                        ),
                        title: Text(
                          drawerData[index]['title'],
                          style: FontUtilities.style(
                              fontSize: 14, fontColor: ColorTheme.darkGrey),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: ColorTheme.darkGrey,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: ColorTheme.lightGrey,
                        height: 0.5,
                        thickness: 1,
                        indent: 1,
                      );
                    },
                    itemCount: drawerData.length),
              );
            }),
            ListTile(
              dense: true,
              onTap: () async {
                EasyLoading.show();
                await SharedPref.signOut();
                EasyLoading.dismiss();
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginSignupScreen();
                  },
                ));
                // context.router.replace(LoginSignupScreenRoute());
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              leading: SvgPicture.asset(
                AppImage.logOut,
              ),
              title: Text(
                "Sign Out",
                style: FontUtilities.style(
                    fontSize: 14, fontColor: ColorTheme.red),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: ColorTheme.red,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
