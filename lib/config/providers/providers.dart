import "package:kk_chicken/features/address/provider/address_provider.dart";
import "package:kk_chicken/features/authentication/login_signup/provider/login_signup_provider.dart";
import "package:kk_chicken/features/cart/provider/cart_provider.dart";
import "package:kk_chicken/features/category/provider/category_provider.dart";
import "package:kk_chicken/features/help/provider/help_provider.dart";
import "package:kk_chicken/features/home/provider/home_provider.dart";
import "package:kk_chicken/features/order/provider/order_provider.dart";
import "package:kk_chicken/features/payment/provider/payment_provider.dart";
import "package:kk_chicken/features/profile/provider/profile_provider.dart";
import "package:kk_chicken/features/splash/provider/splash_provider.dart";
import "package:provider/provider.dart";

class ProviderBindings {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<SplashScreenProvider>(
      create: (context) {
        return SplashScreenProvider();
      },
    ),
    ChangeNotifierProvider<LoginSignupProvider>(
      create: (context) {
        return LoginSignupProvider();
      },
    ),
    ChangeNotifierProvider<HomeProvider>(
      create: (context) {
        return HomeProvider();
      },
    ),
    ChangeNotifierProvider<CategoryProvider>(
      create: (context) {
        return CategoryProvider();
      },
    ),
    ChangeNotifierProvider<CartProvider>(
      create: (context) {
        return CartProvider();
      },
    ),
    ChangeNotifierProvider<AddressProvider>(
      create: (context) {
        return AddressProvider();
      },
    ),
    ChangeNotifierProvider<PaymentProvider>(
      create: (context) {
        return PaymentProvider();
      },
    ),
    ChangeNotifierProvider<ProfileProvider>(
      create: (context) {
        return ProfileProvider();
      },
    ),
    ChangeNotifierProvider<OrderProvider>(
      create: (context) {
        return OrderProvider();
      },
    ),
    ChangeNotifierProvider<HelpProvider>(
      create: (context) {
        return HelpProvider();
      },
    ),
  ];
}
