import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/core/constants/onboard_const.dart';
import 'package:fsc_project/feaure/view/homeScreen/home_screen.dart';
import 'package:fsc_project/feaure/view/onboardScreen/model/onboard_model.dart';
import 'package:fsc_project/feaure/view/onboardScreen/services/onboard_services.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:octo_image/octo_image.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late OnboardServices _onboardServices;
  @override
  void initState() {
    super.initState();
    _onboardServices = OnboardServices();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Onboard>>(
      future: _onboardServices.fetchOnboard(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error Page"),
          );
        } else {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.darkPrimaryRedColor,
              ),
            );
          } else {
            var onboardList = snapshot.data;

            return IntroductionScreen(
              done: Text(
                OnboardConst.doneText,
                style: getButtonStyles(),
              ),
              onDone: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              skip: Text(OnboardConst.skipText, style: getButtonStyles()),
              next: Text(OnboardConst.nextText, style: getButtonStyles()),
              globalBackgroundColor: AppColor.darkPrimaryGreyColor,
              dotsDecorator: getDotDecorations(),
              showSkipButton: true,
              //
              //
              pages: List.generate(
                onboardList!.length,
                (index) {
                  Onboard onboard = onboardList[index];
                  return PageViewModel(
                    title: onboard.title,
                    body: onboard.body,
                    decoration: getPageDecorations(),
                    image: _getOctoImage(
                      url: onboard.image.toString(),
                      hash: onboard.imageHash.toString(),
                    ),
                  );
                },
              ),
            );
          }
        }
      },
    );
  }
}

TextStyle getButtonStyles() => const TextStyle(
    fontSize: 21,
    color: AppColor.darkPrimaryRedColor,
    fontWeight: FontWeight.bold);

TextStyle getTitleStyles() => const TextStyle(
    fontSize: 32,
    color: AppColor.darkPrimaryRedColor,
    fontWeight: FontWeight.bold);

TextStyle getBodyStyles() => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColor.darkPrimaryColor,
    );

PageDecoration getPageDecorations() => PageDecoration(
      descriptionPadding: const EdgeInsets.only(bottom: 30, top: 30),
      titlePadding: const EdgeInsets.only(top: 30, bottom: 15),
      imagePadding: const EdgeInsets.only(top: 40),
      bodyTextStyle: getBodyStyles(),
      titleTextStyle: getTitleStyles(),
    );

DotsDecorator getDotDecorations() => DotsDecorator(
    activeColor: AppColor.darkPrimaryRedColor,
    activeSize: const Size(30, 11),
    size: const Size(11, 11),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    color: AppColor.darkPrimaryColor);

OctoImage _getOctoImage({required String url, required String hash}) =>
    OctoImage(
      image: CachedNetworkImageProvider(
        url,
      ),
      fit: BoxFit.cover,
      placeholderBuilder: OctoPlaceholder.blurHash(hash, fit: BoxFit.cover),
      errorBuilder: OctoError.icon(color: AppColor.darkPrimaryRedColor),
    );
