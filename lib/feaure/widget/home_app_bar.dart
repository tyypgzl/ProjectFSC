import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/feaure/view/home/homeScreen/home_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset(
        "assets/logo/valorant_wiki.png",
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
              "assets/logo/bell.png",
              color: AppColor.darkPrimaryGreyColor,
              width: 25,
              height: 25,
            ),
          ),
        ),
      ],
    );
  }
}
