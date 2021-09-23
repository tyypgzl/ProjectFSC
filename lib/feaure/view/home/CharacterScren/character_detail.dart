import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/feaure/model/karakter.dart';

class CharacterDetailView extends StatelessWidget {
  final Karakter karakter;
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
                  Image.asset(
                    karakter.photo.toString(),
                    fit: BoxFit.cover,
                    height: size.height * .33,
                    color: AppColor.darkPrimaryColor,
                  ),
                  SizedBox(
                    width: size.width * .04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "İsim: ",
                            style: getTextStyle(
                                color: AppColor.darkPrimaryRedColor,
                                fontSize: 22),
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
                                fontSize: 22),
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
                                fontSize: 22),
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
  required Karakter karakter,
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
              child: Image.asset(
                karakter.skill1Url.toString(),
                width: size.width * .05,
              ),
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
              child: Image.asset(
                karakter.skill2Url.toString(),
                width: size.width * .05,
              ),
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
              child: Image.asset(
                karakter.skill3Url.toString(),
                width: size.width * .05,
              ),
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
              child: Image.asset(
                karakter.ultiUrl.toString(),
                width: size.width * .05,
              ),
            ),
          ],
        ),
      ],
    );
