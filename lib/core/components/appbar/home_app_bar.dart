import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/feaure/view/homeScreen/home_screen.dart';

class HomeAppBar extends StatelessWidget {
  final int counter;
  const HomeAppBar({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      leading: Image.asset(
        "assets/logo/valo1.png",
        fit: BoxFit.contain,
      ),
      centerTitle: true,
      elevation: 0,
      title: Text(
        "Valorant Wiki",
        style: getTextStyleHome(
            fontSize: 24, color: AppColor.darkPrimaryGreyColor),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              getAppBarNotificationIcon(size),
              counter != 0 ? getBadge(size, counter) : const Text(""),
            ],
          ),
        ),
      ],
    );
  }
}

Widget getAppBarNotificationIcon(Size size) => InkWell(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Image.asset(
          "assets/logo/bell.png",
          color: AppColor.darkPrimaryGreyColor,
          width: size.width * .09,
          height: size.width * .09,
        ),
      ),
    );

Widget getBadge(Size size, int counter) => Positioned(
      right: size.width * .02,
      top: 0,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),
        constraints: const BoxConstraints(minHeight: 17, minWidth: 17),
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Text(
          counter.toString(),
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
