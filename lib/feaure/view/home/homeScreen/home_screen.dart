import 'package:flutter/material.dart';
import 'package:fsc_project/feaure/view/home/CharacterScren/character_screen.dart';
import 'package:fsc_project/feaure/view/home/NewsScreen/news_screen.dart';
import 'package:fsc_project/feaure/view/home/WeaponScreen/weapon_screen.dart';
import 'package:fsc_project/feaure/view/home/mapSreen/map_screen.dart';
import 'package:fsc_project/feaure/widget/home_app_bar.dart';
import 'package:fsc_project/feaure/widget/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: HomeAppBar(),
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
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MapScreen()));
              },
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
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeaponScreen()));
              },
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
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewsScreen()));
              },
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