import 'package:my_balemoya_app/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsContainerClient extends StatelessWidget {
  const SettingsContainerClient(
      {super.key, required this.name, required this.onTap});
  final String name;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    double? headersize;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width <= 500;
    if (isMobile(context)) {
      headersize = 16;
    } else {
      headersize = 15;
    }
    return Container(
      padding: EdgeInsets.only(top: 18.h, left: 20.w),
      width: double.infinity,
      height: 62.h,
      decoration:
          BoxDecoration(border: Border.all(color: Color(kLightGrey.value))),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          name,
          textAlign: TextAlign.left,
          style: appstyle(headersize + 1, Color(kDark.value), FontWeight.w400),
        ),
      ),
    );
  }
}
