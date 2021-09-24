import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/core/constants/onboard_const.dart';
import 'package:fsc_project/feaure/view/home/homeScreen/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:octo_image/octo_image.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      done: Text(
        "Atla",
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
      skip: Text("Geç", style: getButtonStyles()),
      next: Text("İleri", style: getButtonStyles()),
      showDoneButton: true,
      showNextButton: true,
      showSkipButton: true,
      pages: pageViewModelList,
      globalBackgroundColor: AppColor.darkPrimaryGreyColor,
      dotsDecorator: getDotDecorations(),
    );
  }
}

var pageViewModelList = <PageViewModel>[
  PageViewModel(
    title: OnboardConst.onboard1Title,
    body: OnboardConst.onboard1Body,
    image: _getOctoImage(
        url: OnboardConst.onboard1Photo, hash: "LhNmyhRj~qxujGWBtQoz_3ofIoo2"),
    decoration: getPageDecorations(),
  ),
  PageViewModel(
    title: OnboardConst.onboard2Title,
    body: OnboardConst.onboard2Body,
    image: _getOctoImage(
        url: OnboardConst.onboard2Photo, hash: "TgOpx%kD~q%2ozkC-;xuIUbFWCV@"),
    decoration: getPageDecorations(),
  ),
  PageViewModel(
    title: OnboardConst.onboard3Title,
    body: OnboardConst.onboard3Body,
    image: _getOctoImage(
        url: OnboardConst.onboard3Photo, hash: "TXKKQNx]Rk.T%2%M_3R+o#?boexa"),
    decoration: getPageDecorations(),
  ),
];

TextStyle getButtonStyles() => const TextStyle(
    fontSize: 21,
    color: AppColor.darkPrimaryRedColor,
    fontFamily: "Comforta",
    fontWeight: FontWeight.bold);

TextStyle getTitleStyles() => const TextStyle(
    fontSize: 32,
    color: AppColor.darkPrimaryRedColor,
    fontFamily: "Comforta",
    fontWeight: FontWeight.bold);

TextStyle getBodyStyles() => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.darkPrimaryColor,
    fontFamily: "Comforta");

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
