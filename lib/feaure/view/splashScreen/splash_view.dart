import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/feaure/view/onboardScreen/view/onboard_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: AppColor.darkPrimaryGreyColor,
        alignment: Alignment.center,
        child: _getImage(size),
      ),
    );
  }
}

Widget _getImage(Size size) => Image.asset("assets/logo/valo.png",
    color: AppColor.darkPrimaryRedColor,
    fit: BoxFit.cover,
    width: size.width * .8);
