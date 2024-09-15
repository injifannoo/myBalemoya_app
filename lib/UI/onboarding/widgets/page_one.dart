import 'package:my_balemoya_app/common/custom_btn.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    double? iconWidth;
    double? imageWidth;
    double? headersize;
    double? buttonWidth;
    double? buttonHeight;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        iconWidth = sWidth / 50;
        headersize = 25;
        buttonWidth = 0.7;
        buttonHeight = 50;
      } else {
        iconWidth = sWidth / 50;
        headersize = 17;
        buttonWidth = 0.4;
        buttonHeight = 85;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        iconWidth = sWidth / 50;
        headersize = 20;
        buttonWidth = 0.6;
        buttonHeight = 45;
      } else {
        buttonWidth = 0.4;
        buttonHeight = 65;
        iconWidth = sWidth / 50;
        headersize = 18;
      }
    }
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            orientaion == Orientation.portrait
                ? Image.asset(
                    "assets/images/professions.png",
                  )
                : Image.asset(
                    "assets/images/professions.png",
                    width: sWidth * 0.3,
                  ),
            const HeightSpacer(size: 20),
            Column(
              children: [
                ReusableText(
                    text: "Notifications",
                    style: appstyle(
                        headersize, Color(kBlue.value), FontWeight.normal)),
                const HeightSpacer(size: 10),
                ReusableText(
                    text: "Allow user to recieve new alerts",
                    style: appstyle(headersize - 10, Color(kBlue.value),
                        FontWeight.normal)),
                const HeightSpacer(size: 60),
                FractionallySizedBox(
                    widthFactor: buttonWidth,
                    child: CustomButton(
                      text: "Notify me",
                      size: headersize - 7,
                      fw: FontWeight.normal,
                      width: buttonWidth,
                      height: buttonHeight,
                      bcolor: Color(kOrange.value),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
