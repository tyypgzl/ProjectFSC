import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/feaure/view/CharacterScreen/model/character.dart';
import 'package:octo_image/octo_image.dart';

class CharacterDetailView extends StatelessWidget {
  final CharacterModel karakter;
  const CharacterDetailView({Key? key, required this.karakter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          karakter.isim.toString().toUpperCase(),
          style:
              getTextStyle(color: AppColor.darkPrimaryGreyColor, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          width: size.width,
          color: AppColor.darkPrimaryGreyColor,
          child: Column(
            children: [
              getSizedBoxHeight(size.height * .03),
              Text(
                "Biyografi",
                style: getTextStyle(
                    color: AppColor.darkPrimaryRedColor, fontSize: 24),
              ),
              getSizedBoxHeight(size.height * .02),
              Text(
                karakter.bio.toString(),
                style: getTextStyle(
                    color: AppColor.darkPrimaryColor, fontSize: 16.0),
              ),
              getSizedBoxHeight(size.height * .02),
              getDivider(),
              getSizedBoxHeight(size.height * .02),
              Row(
                children: [
                  _getOctoImageCharacter(
                      karakter: karakter,
                      size: size,
                      hash: "TtNK9jM{~qRiayt7xuofM{xuayWB"),
                  SizedBox(
                    width: size.width * .04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "İsim: ",
                            style: getTextStyle(
                                color: AppColor.darkPrimaryRedColor,
                                fontSize: 21),
                          ),
                          Text(
                            karakter.isim.toString(),
                            style: getTextStyle(
                                color: AppColor.darkPrimaryColor, fontSize: 18),
                          )
                        ],
                      ),
                      getSizedBoxHeight(size.height * .04),
                      Row(
                        children: [
                          Text(
                            "Ülke: ",
                            style: getTextStyle(
                                color: AppColor.darkPrimaryRedColor,
                                fontSize: 21),
                          ),
                          Text(
                            karakter.ulke.toString(),
                            style: getTextStyle(
                                color: AppColor.darkPrimaryColor, fontSize: 18),
                          )
                        ],
                      ),
                      getSizedBoxHeight(size.height * .04),
                      Row(
                        children: [
                          Text(
                            "Rol: ",
                            style: getTextStyle(
                                color: AppColor.darkPrimaryRedColor,
                                fontSize: 21),
                          ),
                          getSizedBoxHeight(10),
                          Text(
                            karakter.rol.toString(),
                            style: getTextStyle(
                                color: AppColor.darkPrimaryColor, fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              getSizedBoxHeight(size.height * .02),
              getDivider(),
              getSizedBoxHeight(size.height * .02),
              getYetenekText(),
              getSizedBoxHeight(size.height * .03),
              getSkillsColumn(karakter: karakter, size: size),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getYetenekText() => Text(
      "Yetenekler",
      style: getTextStyle(
        fontSize: 24,
        color: AppColor.darkPrimaryRedColor,
      ),
    );

TextStyle getTextStyle({required double fontSize, required Color color}) =>
    TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
        fontFamily: "Comforta");

Widget getSizedBoxHeight(double height) => SizedBox(
      height: height,
    );

Widget getDivider() => const Divider(
      color: AppColor.darkPrimaryRedColor,
      endIndent: 5,
      indent: 5,
      thickness: 1.5,
    );

Widget getSkillsColumn({
  required CharacterModel karakter,
  required Size size,
}) =>
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * .58,
              height: size.height * .1,
              margin: EdgeInsets.symmetric(horizontal: size.width * .01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.darkPrimaryRedColor,
              ),
              child: Center(
                child: Text(
                  karakter.skill1.toString(),
                  style: getTextStyle(
                      fontSize: 22, color: AppColor.darkPrimaryGreyColor),
                ),
              ),
            ),
            SizedBox(
              width: size.width * .05,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: size.height * .1,
              width: size.height * .1,
              margin: EdgeInsets.symmetric(horizontal: size.width * .01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.darkPrimaryRedColor,
              ),
              child: _getOctoImageSkill1(karakter: karakter, size: size),
            ),
          ],
        ),
        getSizedBoxHeight(size.height * .02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * .58,
              height: size.height * .1,
              margin: EdgeInsets.symmetric(horizontal: size.width * .01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.darkPrimaryRedColor,
              ),
              child: Center(
                child: Text(
                  karakter.skill2.toString(),
                  style: getTextStyle(
                      fontSize: 22, color: AppColor.darkPrimaryGreyColor),
                ),
              ),
            ),
            SizedBox(
              width: size.width * .05,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: size.height * .1,
              width: size.height * .1,
              margin: EdgeInsets.symmetric(horizontal: size.width * .01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.darkPrimaryRedColor,
              ),
              child: _getOctoImageSkill2(karakter: karakter, size: size),
            ),
          ],
        ),
        getSizedBoxHeight(size.height * .02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * .58,
              height: size.height * .1,
              margin: EdgeInsets.symmetric(horizontal: size.width * .01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.darkPrimaryRedColor,
              ),
              child: Center(
                child: Text(
                  karakter.skill3.toString(),
                  style: getTextStyle(
                      fontSize: 22, color: AppColor.darkPrimaryGreyColor),
                ),
              ),
            ),
            SizedBox(
              width: size.width * .05,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: size.height * .1,
              width: size.height * .1,
              margin: EdgeInsets.symmetric(horizontal: size.width * .01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.darkPrimaryRedColor,
              ),
              child: _getOctoImageSkill3(karakter: karakter, size: size),
            ),
          ],
        ),
        getSizedBoxHeight(size.height * .02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * .58,
              height: size.height * .1,
              margin: EdgeInsets.symmetric(horizontal: size.width * .01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.darkPrimaryRedColor,
              ),
              child: Center(
                child: Text(
                  karakter.ulti.toString(),
                  style: getTextStyle(
                      fontSize: 22, color: AppColor.darkPrimaryGreyColor),
                ),
              ),
            ),
            SizedBox(
              width: size.width * .05,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: size.height * .1,
              width: size.height * .1,
              margin: EdgeInsets.symmetric(horizontal: size.width * .01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.darkPrimaryRedColor,
              ),
              child: _getOctoImageSkill4(karakter: karakter, size: size),
            ),
          ],
        ),
      ],
    );

OctoImage _getOctoImageCharacter(
        {required CharacterModel karakter,
        required Size size,
        required String hash}) =>
    OctoImage(
      image: CachedNetworkImageProvider(
        karakter.photo.toString(),
      ),
      fit: BoxFit.cover,
      height: size.height * .33,
      color: AppColor.darkPrimaryColor,
      placeholderBuilder: OctoPlaceholder.blurHash(hash, fit: BoxFit.cover),
      errorBuilder: OctoError.icon(color: AppColor.darkPrimaryGreyColor),
    );

OctoImage _getOctoImageSkill1({
  required CharacterModel karakter,
  required Size size,
}) =>
    OctoImage(
      image: CachedNetworkImageProvider(
        karakter.skill1Url.toString(),
      ),
      fit: BoxFit.cover,
      width: size.width * .05,
      color: AppColor.darkPrimaryGreyColor,
      placeholderBuilder: OctoPlaceholder.circleAvatar(
        backgroundColor: AppColor.darkPrimaryRedColor,
        text: const Icon(
          Icons.restart_alt,
          color: AppColor.darkPrimaryGreyColor,
          size: 30,
        ),
      ),
      errorBuilder: OctoError.icon(color: AppColor.darkPrimaryGreyColor),
    );

OctoImage _getOctoImageSkill2({
  required CharacterModel karakter,
  required Size size,
}) =>
    OctoImage(
      image: CachedNetworkImageProvider(
        karakter.skill2Url.toString(),
      ),
      fit: BoxFit.cover,
      width: size.width * .05,
      color: AppColor.darkPrimaryGreyColor,
      placeholderBuilder: OctoPlaceholder.circleAvatar(
        backgroundColor: AppColor.darkPrimaryRedColor,
        text: const Icon(
          Icons.restart_alt,
          color: AppColor.darkPrimaryGreyColor,
          size: 30,
        ),
      ),
      errorBuilder: OctoError.icon(color: AppColor.darkPrimaryGreyColor),
    );

OctoImage _getOctoImageSkill3({
  required CharacterModel karakter,
  required Size size,
}) =>
    OctoImage(
      image: CachedNetworkImageProvider(
        karakter.skill3Url.toString(),
      ),
      fit: BoxFit.cover,
      width: size.width * .05,
      color: AppColor.darkPrimaryGreyColor,
      placeholderBuilder: OctoPlaceholder.circleAvatar(
        backgroundColor: AppColor.darkPrimaryRedColor,
        text: const Icon(
          Icons.restart_alt,
          color: AppColor.darkPrimaryGreyColor,
          size: 30,
        ),
      ),
      errorBuilder: OctoError.icon(color: AppColor.darkPrimaryGreyColor),
    );

OctoImage _getOctoImageSkill4({
  required CharacterModel karakter,
  required Size size,
}) =>
    OctoImage(
      image: CachedNetworkImageProvider(
        karakter.ultiUrl.toString(),
      ),
      fit: BoxFit.cover,
      width: size.width * .05,
      color: AppColor.darkPrimaryGreyColor,
      placeholderBuilder: OctoPlaceholder.circleAvatar(
        backgroundColor: AppColor.darkPrimaryRedColor,
        text: const Icon(
          Icons.restart_alt,
          color: AppColor.darkPrimaryGreyColor,
          size: 30,
        ),
      ),
      errorBuilder: OctoError.icon(color: AppColor.darkPrimaryGreyColor),
    );
