import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/feaure/view/home/homeScreen/home_screen.dart';
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
    title: "LIMIT TANIMA",
    body:
        "Küresel, rekabetçi bir sahnede tarzını ve deneyimini birleştir. Silahlarla ve taktiksel yeteneklerle saldırıp savunma yapacağın 13 tur var. Her turda tek bir cana sahip olduğun için hayatta kalmak istiyorsan rakiplerinden daha hızlı düşünmen gerekir.",
    image: getImage1("onboard"),
    decoration: getPageDecorations(),
  ),
  PageViewModel(
    title: "SENIN AJANLARIN",
    body:
        "İş silahlar ve mermilerle bitmiyor; duruma uyum sağlayan, çevik ve ölümcül yetenekleri olan ajanlardan birini seç ve kendini gösterebileceğin anları kolla. Her ajan bambaşka şekilde oynanır ve tüm önemli anlar birbirinden farklı olur.",
    image: getImage2("raze"),
    decoration: getPageDecorations(),
  ),
  PageViewModel(
    title: "SENİN HARITALARIN",
    body:
        "Tüm haritalar yaratıcı düşünme becerisini öne çıkaracak bir alan görevi görür. Her biri takım stratejileri, muhteşem oyunlar ve ucu ucuna geçen karşılaşmalar için özel olarak tasarlanmıştır. Diğerlerinin yıllar boyunca taklit edeceği hareketler gerçekleştir.",
    image: getImage3("map3"),
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

Image getImage1(
  String url,
) =>
    Image.asset(
      "assets/images/$url.png",
      width: 310,
      fit: BoxFit.cover,
    );

Image getImage2(
  String url,
) =>
    Image.asset(
      "assets/images/$url.png",
      height: 400,
      fit: BoxFit.cover,
    );

Image getImage3(
  String url,
) =>
    Image.asset(
      "assets/images/$url.png",
      width: 350,
      fit: BoxFit.cover,
    );
