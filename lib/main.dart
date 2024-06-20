import 'package:aktaris_app/presentation/routes/routes.dart';
import 'package:aktaris_app/presentation/ui/bottom_navbar/navbar_component.dart';
import 'package:aktaris_app/presentation/ui/message/preview_file_message/preview_file_message_page.dart';
import 'package:aktaris_app/presentation/ui/splash/splash_page.dart';
import 'package:aktaris_app/presentation/ui/transaction/detail_history/detail_history_page.dart';
import 'package:aktaris_app/service_locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:upgrader/upgrader.dart';

import 'config/env/app_env.dart';
import 'presentation/ui/auth/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  await Upgrader.clearSavedSettings();
  AppEnv.set(Environment.DEVELOPMENT);
  runApp(const MyApp(
      // DevicePreview(
      // builder: (context) => const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          title: 'Aktaris Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          getPages: AppPages.routes,
          // home: const PreviewFileMessagePage(),
          // initialRoute: BottomNavBarComponent.routeName,
          initialRoute: SplashPage.routeName,
        );
      },
      //  GetMaterialApp(
      //     useInheritedMediaQuery: true,
      //     locale: DevicePreview.locale(context),
      //     builder: DevicePreview.appBuilder,
      //     title: 'Flutter Demo',
      //     debugShowCheckedModeBanner: false,
      //     theme: ThemeData(
      //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //       useMaterial3: true,
      //     ),
      //     getPages: AppPages.routes,
      //     // home: const ChatPage(),
      //     // initialRoute: BottomNavBarComponent.routeName,
      //     initialRoute: BottomNavBarComponent.routeName,
      //   ),
    );
  }
}
