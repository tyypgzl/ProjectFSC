import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/feaure/view/home/CharacterScren/character_screen.dart';
import 'package:fsc_project/feaure/widget/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/logo/valo2.png",
          fit: BoxFit.contain,
        ),
        centerTitle: true,
        title: Text(
          "Valorant Wiki",
          style: getTextStyleHome(
              fontSize: 24, color: AppColor.darkPrimaryGreyColor),
        ),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/logo/logout.png",
                color: AppColor.darkPrimaryRedColor,
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCardsDesign(
              size: size,
              text: "Ajanlar",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CharacterScreen()));
              },
              child: Image.asset(
                "assets/images/agents.png",
                width: size.width * .75,
              ),
            ),
            HomeCardsDesign(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/images/home2.jpg",
                  width: size.width * .75,
                ),
              ),
              size: size,
              text: "Haritalar",
              press: () {},
            ),
            HomeCardsDesign(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/images/home4.jpg",
                  width: size.width * .75,
                ),
              ),
              size: size,
              text: "Silahlar",
              press: () {},
            ),
            HomeCardsDesign(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/images/home5.jpg",
                  width: size.width * .75,
                ),
              ),
              size: size,
              text: "Haberler",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle getTextStyleHome({required double fontSize, required Color color}) =>
    TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
        fontFamily: "Comforta");
