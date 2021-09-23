import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/feaure/view/home/CharacterScren/character_detail.dart';

class CAppBar extends StatelessWidget {
  final String text;

  const CAppBar({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        text,
        style: getTextStyle(fontSize: 24, color: AppColor.darkPrimaryGreyColor),
      ),
    );
  }
}
