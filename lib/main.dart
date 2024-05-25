import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:kk_chicken/config/config.dart';
import 'package:kk_chicken/features/splash/view/splash_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const KKChickenApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..userInteractions = false
    ..dismissOnTap = false;
}

class KKChickenApp extends StatefulWidget {
  const KKChickenApp({super.key});

  @override
  State<KKChickenApp> createState() => _KKChickenAppState();
}

class _KKChickenAppState extends State<KKChickenApp> {
  // final _route = AppRoute();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderBindings.providers,
      child: MaterialApp(
        home: const SplashPage(),
        debugShowCheckedModeBanner: false,
        // routerConfig: _route.config(
        //   deepLinkBuilder: (deepLink) {
        //     return deepLink;
        //   },
        // ),
        builder: EasyLoading.init(),

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'Poppins',
          useMaterial3: true,
        ),
      ),
    );
  }
}
