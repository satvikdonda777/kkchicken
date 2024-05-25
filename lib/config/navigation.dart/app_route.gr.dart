// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // AutoRouterGenerator
// // **************************************************************************

// // ignore_for_file: type=lint
// // coverage:ignore-file

// part of 'app_route.dart';

// abstract class _$AppRoute extends RootStackRouter {
//   // ignore: unused_element
//   _$AppRoute({super.navigatorKey});

//   @override
//   final Map<String, PageFactory> pagesMap = {
//     AllChickenViewRoute.name: (routeData) {
//       final args = routeData.argsAs<AllChickenViewRouteArgs>();
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: AllChickenView(
//           key: args.key,
//           chikenList: args.chikenList,
//           categoryName: args.categoryName,
//         ),
//       );
//     },
//     AllFoodScreenRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const AllFoodScreen(),
//       );
//     },
//     AppDocumentScreenRoute.name: (routeData) {
//       final args = routeData.argsAs<AppDocumentScreenRouteArgs>();
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: AppDocumentScreen(
//           key: args.key,
//           docType: args.docType,
//         ),
//       );
//     },
//     CartScreenRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const CartScreen(),
//       );
//     },
//     CategoryScreenRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const CategoryScreen(),
//       );
//     },
//     ChangePasswordScreenRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const ChangePasswordScreen(),
//       );
//     },
//     FillAddressScreenRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const FillAddressScreen(),
//       );
//     },
//     FoodDetailScreenRoute.name: (routeData) {
//       final args = routeData.argsAs<FoodDetailScreenRouteArgs>();
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: FoodDetailScreen(
//           key: args.key,
//           chickenFoodModel: args.chickenFoodModel,
//         ),
//       );
//     },
//     ForgotPasswordScreenRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const ForgotPasswordScreen(),
//       );
//     },
//     HelpScreenRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const HelpScreen(),
//       );
//     },
//     HomeScreenRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const HomeScreen(),
//       );
//     },
//     InvoiceScreenRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const InvoiceScreen(),
//       );
//     },
//     LoginSignupScreenRoute.name: (routeData) {
//       final args = routeData.argsAs<LoginSignupScreenRouteArgs>(
//           orElse: () => const LoginSignupScreenRouteArgs());
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: LoginSignupScreen(
//           key: args.key,
//           isSignup: args.isSignup,
//         ),
//       );
//     },
//     MyOrderScreenRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const MyOrderScreen(),
//       );
//     },
//     OfferProductViewRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const OfferProductView(),
//       );
//     },
//     PaymentMethodScreenRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const PaymentMethodScreen(),
//       );
//     },
//     PaymentStatScreenRoute.name: (routeData) {
//       final args = routeData.argsAs<PaymentStatScreenRouteArgs>();
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: PaymentStatScreen(
//           key: args.key,
//           orderId: args.orderId,
//         ),
//       );
//     },
//     ProfileScreenRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const ProfileScreen(),
//       );
//     },
//     SplashPageRoute.name: (routeData) {
//       return AutoRoutePage<dynamic>(
//         routeData: routeData,
//         child: const SplashPage(),
//       );
//     },
//   };
// }

// /// generated route for
// /// [AllChickenView]
// class AllChickenViewRoute extends PageRouteInfo<AllChickenViewRouteArgs> {
//   AllChickenViewRoute({
//     Key? key,
//     required List<HomeData> chikenList,
//     required String categoryName,
//     List<PageRouteInfo>? children,
//   }) : super(
//           AllChickenViewRoute.name,
//           args: AllChickenViewRouteArgs(
//             key: key,
//             chikenList: chikenList,
//             categoryName: categoryName,
//           ),
//           initialChildren: children,
//         );

//   static const String name = 'AllChickenViewRoute';

//   static const PageInfo<AllChickenViewRouteArgs> page =
//       PageInfo<AllChickenViewRouteArgs>(name);
// }

// class AllChickenViewRouteArgs {
//   const AllChickenViewRouteArgs({
//     this.key,
//     required this.chikenList,
//     required this.categoryName,
//   });

//   final Key? key;

//   final List<HomeData> chikenList;

//   final String categoryName;

//   @override
//   String toString() {
//     return 'AllChickenViewRouteArgs{key: $key, chikenList: $chikenList, categoryName: $categoryName}';
//   }
// }

// /// generated route for
// /// [AllFoodScreen]
// class AllFoodScreenRoute extends PageRouteInfo<void> {
//   const AllFoodScreenRoute({List<PageRouteInfo>? children})
//       : super(
//           AllFoodScreenRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'AllFoodScreenRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [AppDocumentScreen]
// class AppDocumentScreenRoute extends PageRouteInfo<AppDocumentScreenRouteArgs> {
//   AppDocumentScreenRoute({
//     Key? key,
//     required String docType,
//     List<PageRouteInfo>? children,
//   }) : super(
//           AppDocumentScreenRoute.name,
//           args: AppDocumentScreenRouteArgs(
//             key: key,
//             docType: docType,
//           ),
//           initialChildren: children,
//         );

//   static const String name = 'AppDocumentScreenRoute';

//   static const PageInfo<AppDocumentScreenRouteArgs> page =
//       PageInfo<AppDocumentScreenRouteArgs>(name);
// }

// class AppDocumentScreenRouteArgs {
//   const AppDocumentScreenRouteArgs({
//     this.key,
//     required this.docType,
//   });

//   final Key? key;

//   final String docType;

//   @override
//   String toString() {
//     return 'AppDocumentScreenRouteArgs{key: $key, docType: $docType}';
//   }
// }

// /// generated route for
// /// [CartScreen]
// class CartScreenRoute extends PageRouteInfo<void> {
//   const CartScreenRoute({List<PageRouteInfo>? children})
//       : super(
//           CartScreenRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'CartScreenRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [CategoryScreen]
// class CategoryScreenRoute extends PageRouteInfo<void> {
//   const CategoryScreenRoute({List<PageRouteInfo>? children})
//       : super(
//           CategoryScreenRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'CategoryScreenRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [ChangePasswordScreen]
// class ChangePasswordScreenRoute extends PageRouteInfo<void> {
//   const ChangePasswordScreenRoute({List<PageRouteInfo>? children})
//       : super(
//           ChangePasswordScreenRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'ChangePasswordScreenRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [FillAddressScreen]
// class FillAddressScreenRoute extends PageRouteInfo<void> {
//   const FillAddressScreenRoute({List<PageRouteInfo>? children})
//       : super(
//           FillAddressScreenRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'FillAddressScreenRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [FoodDetailScreen]
// class FoodDetailScreenRoute extends PageRouteInfo<FoodDetailScreenRouteArgs> {
//   FoodDetailScreenRoute({
//     Key? key,
//     required HomeData chickenFoodModel,
//     List<PageRouteInfo>? children,
//   }) : super(
//           FoodDetailScreenRoute.name,
//           args: FoodDetailScreenRouteArgs(
//             key: key,
//             chickenFoodModel: chickenFoodModel,
//           ),
//           initialChildren: children,
//         );

//   static const String name = 'FoodDetailScreenRoute';

//   static const PageInfo<FoodDetailScreenRouteArgs> page =
//       PageInfo<FoodDetailScreenRouteArgs>(name);
// }

// class FoodDetailScreenRouteArgs {
//   const FoodDetailScreenRouteArgs({
//     this.key,
//     required this.chickenFoodModel,
//   });

//   final Key? key;

//   final HomeData chickenFoodModel;

//   @override
//   String toString() {
//     return 'FoodDetailScreenRouteArgs{key: $key, chickenFoodModel: $chickenFoodModel}';
//   }
// }

// /// generated route for
// /// [ForgotPasswordScreen]
// class ForgotPasswordScreenRoute extends PageRouteInfo<void> {
//   const ForgotPasswordScreenRoute({List<PageRouteInfo>? children})
//       : super(
//           ForgotPasswordScreenRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'ForgotPasswordScreenRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [HelpScreen]
// class HelpScreenRoute extends PageRouteInfo<void> {
//   const HelpScreenRoute({List<PageRouteInfo>? children})
//       : super(
//           HelpScreenRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'HelpScreenRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [HomeScreen]
// class HomeScreenRoute extends PageRouteInfo<void> {
//   const HomeScreenRoute({List<PageRouteInfo>? children})
//       : super(
//           HomeScreenRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'HomeScreenRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [InvoiceScreen]
// class InvoiceScreenRoute extends PageRouteInfo<void> {
//   const InvoiceScreenRoute({List<PageRouteInfo>? children})
//       : super(
//           InvoiceScreenRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'InvoiceScreenRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [LoginSignupScreen]
// class LoginSignupScreenRoute extends PageRouteInfo<LoginSignupScreenRouteArgs> {
//   LoginSignupScreenRoute({
//     Key? key,
//     bool isSignup = false,
//     List<PageRouteInfo>? children,
//   }) : super(
//           LoginSignupScreenRoute.name,
//           args: LoginSignupScreenRouteArgs(
//             key: key,
//             isSignup: isSignup,
//           ),
//           initialChildren: children,
//         );

//   static const String name = 'LoginSignupScreenRoute';

//   static const PageInfo<LoginSignupScreenRouteArgs> page =
//       PageInfo<LoginSignupScreenRouteArgs>(name);
// }

// class LoginSignupScreenRouteArgs {
//   const LoginSignupScreenRouteArgs({
//     this.key,
//     this.isSignup = false,
//   });

//   final Key? key;

//   final bool isSignup;

//   @override
//   String toString() {
//     return 'LoginSignupScreenRouteArgs{key: $key, isSignup: $isSignup}';
//   }
// }

// /// generated route for
// /// [MyOrderScreen]
// class MyOrderScreenRoute extends PageRouteInfo<void> {
//   const MyOrderScreenRoute({List<PageRouteInfo>? children})
//       : super(
//           MyOrderScreenRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'MyOrderScreenRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [OfferProductView]
// class OfferProductViewRoute extends PageRouteInfo<void> {
//   const OfferProductViewRoute({List<PageRouteInfo>? children})
//       : super(
//           OfferProductViewRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'OfferProductViewRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [PaymentMethodScreen]
// class PaymentMethodScreenRoute extends PageRouteInfo<void> {
//   const PaymentMethodScreenRoute({List<PageRouteInfo>? children})
//       : super(
//           PaymentMethodScreenRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'PaymentMethodScreenRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [PaymentStatScreen]
// class PaymentStatScreenRoute extends PageRouteInfo<PaymentStatScreenRouteArgs> {
//   PaymentStatScreenRoute({
//     Key? key,
//     required String orderId,
//     List<PageRouteInfo>? children,
//   }) : super(
//           PaymentStatScreenRoute.name,
//           args: PaymentStatScreenRouteArgs(
//             key: key,
//             orderId: orderId,
//           ),
//           initialChildren: children,
//         );

//   static const String name = 'PaymentStatScreenRoute';

//   static const PageInfo<PaymentStatScreenRouteArgs> page =
//       PageInfo<PaymentStatScreenRouteArgs>(name);
// }

// class PaymentStatScreenRouteArgs {
//   const PaymentStatScreenRouteArgs({
//     this.key,
//     required this.orderId,
//   });

//   final Key? key;

//   final String orderId;

//   @override
//   String toString() {
//     return 'PaymentStatScreenRouteArgs{key: $key, orderId: $orderId}';
//   }
// }

// /// generated route for
// /// [ProfileScreen]
// class ProfileScreenRoute extends PageRouteInfo<void> {
//   const ProfileScreenRoute({List<PageRouteInfo>? children})
//       : super(
//           ProfileScreenRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'ProfileScreenRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }

// /// generated route for
// /// [SplashPage]
// class SplashPageRoute extends PageRouteInfo<void> {
//   const SplashPageRoute({List<PageRouteInfo>? children})
//       : super(
//           SplashPageRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'SplashPageRoute';

//   static const PageInfo<void> page = PageInfo<void>(name);
// }
