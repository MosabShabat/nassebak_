import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'consts/conste.dart';
import 'features/bag_page/screens/bag_screen.dart';
import 'features/home/controller/home_controller.dart';
import 'features/home_page/controller/home_page_controller.dart';
import 'features/rewards/screens/rewards_screen.dart';
import 'features/splash_screen/splash_screen.dart';
import 'local/my_local_controller.dart';
import 'local/local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());
    var controller1 = Get.put(HomeController());
    Get.put(HomePageController());
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: sansAloft,
        scaffoldBackgroundColor: blackColor,
        appBarTheme: const AppBarTheme(
          color: whiteColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
        ),
      ),
      locale: controller.initialLang,
      translations: MyLocal(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        // GetPage(name: '/packages', page: () => PackagesScreen()),
        GetPage(name: '/rewards', page: () => RewardsScreens()),

        // RewardsScreens
      ],
    );
  }
}
