import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';

import 'feaure/view/splashScreen/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Valorant Info',
        theme: ThemeData(
          fontFamily: "Comforta",
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColor.darkPrimaryColor,
              elevation: 2,
              shadowColor: AppColor.darkPrimaryRedColor,
              foregroundColor: AppColor.darkPrimaryGreyColor),
        ),
        home: const SplashScreen());
  }
}
