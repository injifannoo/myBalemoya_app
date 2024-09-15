import 'package:my_balemoya_app/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn(
      {super.key,
      required this.width,
      required this.height,
      required this.text,
      this.onTap,
      required this.color,
      required this.size,
      this.bcolor});
  final double width;
  final double height;
  final double size;
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color? bcolor;

  @override
  Widget build(BuildContext context) {
    double? buttonWidth;
    double? buttonHeight;

    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width <= 500;
    double? sWidth = MediaQuery.of(context).size.width;
    if (isMobile(context)) {
      buttonHeight = 30.h;

      buttonWidth = 92;
    } else {
      buttonWidth = 72;

      buttonHeight = 29.h;
    }
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          disabledBackgroundColor: bcolor,
          backgroundColor: bcolor!, // Set the background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r), // Set the border radius
          ),
        ),
        onPressed: onTap,
        child: ReusableText(
            text: text,
            style: appstyle(
                size ?? 16, color ?? Color(kLight.value), FontWeight.normal)),
      ),
    );
  }
}
