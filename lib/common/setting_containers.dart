import 'package:my_balemoya_app/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key, required this.name, required this.onTap});
  final String name;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    double loginWidth;
    double? iconwidth;
    double? containerheight;
    double? headersize;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        containerheight = 60.h;

        headersize = 17;
        iconwidth = 0.06;
      } else {
        containerheight = 100.h;

        headersize = 11;
        iconwidth = 0.06;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        iconwidth = 0.05;
        headersize = 16;
        containerheight = 58.h;
      } else {
        iconwidth = 0.05;
        headersize = 13;
        containerheight = 68.h;
      }
    }
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      width: double.infinity,
      height: containerheight,
      decoration:
          BoxDecoration(border: Border.all(color: Color(kLightGrey.value))),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          name,
          textAlign: TextAlign.left,
          style: appstyle(headersize, Color(kDark.value), FontWeight.w400),
        ),
      ),
    );
  }
}
