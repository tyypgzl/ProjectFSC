import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:introduction_screen/introduction_screen.dart';

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
      onDone: () {},
      skip: Text("Geç", style: getButtonStyles()),
      next: Text("İleri", style: getButtonStyles()),
      showDoneButton: true,
      showNextButton: true,
      showSkipButton: true,
      pages: pageViewModelList,
      globalBackgroundColor: AppColor.darkPrimaryRedAccentColor,
      dotsDecorator: getDotDecorations(),
    );
  }
}

var pageViewModelList = <PageViewModel>[
  PageViewModel(
    title: "LIMIT TANIMA",
    body:
        "Küresel, rekabetçi bir sahnede tarzını ve deneyimini birleştir. Silahlarla ve taktiksel yeteneklerle saldırıp savunma yapacağın 13 tur var. Her turda tek bir cana sahip olduğun için hayatta kalmak istiyorsan rakiplerinden daha hızlı düşünmen gerekir.",
    image: getImage("jett"),
    decoration: getPageDecorations(),
  ),
  PageViewModel(
    title: "SENIN AJANLARIN",
    body:
        "İş silahlar ve mermilerle bitmiyor; duruma uyum sağlayan, çevik ve ölümcül yetenekleri olan ajanlardan birini seç ve kendini gösterebileceğin anları kolla. Her ajan bambaşka şekilde oynanır ve tüm önemli anlar birbirinden farklı olur.",
    image: getImage("raze"),
    decoration: getPageDecorations(),
  ),
  PageViewModel(
    title: "SENİN HARITALARIN",
    body:
        "Tüm haritalar yaratıcı düşünme becerisini öne çıkaracak bir alan görevi görür. Her biri takım stratejileri, muhteşem oyunlar ve ucu ucuna geçen karşılaşmalar için özel olarak tasarlanmıştır. Diğerlerinin yıllar boyunca taklit edeceği hareketler gerçekleştir.",
    image: getImage("phoenix"),
    decoration: getPageDecorations(),
  ),
];

TextStyle getButtonStyles() => const TextStyle(
    fontSize: 21,
    color: AppColor.darkPrimaryColor,
    fontFamily: "Comforta",
    fontWeight: FontWeight.bold);

TextStyle getTitleStyles() => const TextStyle(
    fontSize: 32,
    color: AppColor.darkPrimaryColor,
    fontFamily: "Comforta",
    fontWeight: FontWeight.bold);

TextStyle getBodyStyles() => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.darkPrimaryTextColor,
    fontFamily: "Comforta");

PageDecoration getPageDecorations() => PageDecoration(
      descriptionPadding: const EdgeInsets.only(bottom: 35, top: 35),
      titlePadding: const EdgeInsets.only(top: 45, bottom: 15),
      imagePadding: const EdgeInsets.only(top: 70),
      bodyTextStyle: getBodyStyles(),
      titleTextStyle: getTitleStyles(),
    );

DotsDecorator getDotDecorations() => DotsDecorator(
    activeColor: AppColor.darkPrimaryTextColor,
    activeSize: const Size(24, 11),
    size: const Size(11, 11),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    color: AppColor.darkPrimaryColor);

Image getImage(
  String url,
) =>
    Image.asset(
      "assets/images/$url.png",
      width: 195,
      fit: BoxFit.cover,
    );
