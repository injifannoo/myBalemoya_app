import 'package:my_balemoya_app/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.color,
      this.onTap,
      required this.size,
      this.bcolor,
      required this.fw,
      required this.width,
      required this.height});
  final String text;
  final double size;
  final Color? color;
  final Color? bcolor;
  final FontWeight fw;
  final double width;
  final double height;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          disabledBackgroundColor: bcolor,
          backgroundColor: bcolor!, // Set the background color
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(height.h), // Set the border radius
          ),
        ),
        onPressed: onTap,
        child: ReusableText(
            text: text,
            style: appstyle(size, color ?? Color(kLight.value), fw)),
      ),
    );
  }
}
