import 'package:flutter/material.dart';
import 'package:fsc_project/core/constants/app_color.dart';
import 'package:fsc_project/feaure/view/home/CharacterScren/character_detail.dart';

class HomeCardsDesign extends StatelessWidget {
  const HomeCardsDesign({
    Key? key,
    required this.size,
    required this.text,
    required this.press,
    required this.child,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function press;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: size.width * .92,
            height: size.height * .23,
            decoration: BoxDecoration(
              color: AppColor.darkPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: size.width * .03,
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    text,
                    style: getTextStyle(
                        fontSize: 26, color: AppColor.darkPrimaryGreyColor),
                  ),
                ),
                SizedBox(
                  width: size.width * .03,
                ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
