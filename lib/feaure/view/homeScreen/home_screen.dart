import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/core/constants/home_const.dart';
import 'package:fsc_project/feaure/view/CharacterScreen/view/character_screen.dart';
import 'package:fsc_project/feaure/view/NewsScreen/view/news_view.dart';
import 'package:fsc_project/feaure/view/WeaponScreen/view/weapon_view.dart';

import 'package:fsc_project/core/components/appbar/home_app_bar.dart';
import 'package:fsc_project/core/components/card/home_card.dart';
import 'package:fsc_project/feaure/view/mapSreen/view/map_view.dart';
import 'package:octo_image/octo_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: HomeAppBar(
          counter: 2,
        ),
      ),
      body: ListView(
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
            child: _getOctoImage(
                url: HomeConst.home1Photo,
                size: size,
                hash: "TYM7r*og~q?bfkRj~qWAM{%NoeRj"),
          ),
          HomeCardsDesign(
            child: _getOctoImage(
                url: HomeConst.home2Photo,
                size: size,
                hash: "TYFr|xGZ9F_MS~WCK\$v~tRTxsmSg"),
            size: size,
            text: "Haritalar",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MapScreen()));
            },
          ),
          HomeCardsDesign(
            child: _getOctoImage(
                url: HomeConst.home3Photo,
                size: size,
                hash: "T97n,a#p9G~AxuEMn5s:RkI?n+nO"),
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
            child: _getOctoImage(
                url: HomeConst.home4Photo,
                size: size,
                hash: "T3ATD@n400?vr;IA0K-o^k[C=|GG"),
            size: size,
            text: "Haberler",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewsScreen()));
            },
          ),
        ],
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

OctoImage _getOctoImage(
        {required String url, required Size size, required String hash}) =>
    OctoImage(
      image: CachedNetworkImageProvider(
        url,
      ),
      fit: BoxFit.cover,
      width: size.width * .75,
      placeholderBuilder: OctoPlaceholder.blurHash(hash, fit: BoxFit.cover),
      errorBuilder: OctoError.icon(color: AppColor.darkPrimaryRedColor),
    );
