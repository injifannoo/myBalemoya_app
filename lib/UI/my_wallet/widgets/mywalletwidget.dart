import 'package:my_balemoya_app/common/exports.dart';

import 'package:my_balemoya_app/common/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyWalletWidget extends StatelessWidget {
  const MyWalletWidget(
      {super.key, required this.name, required this.Tno, required this.amount});

  final String name;
  final String Tno;
  final String amount;
  @override
  Widget build(BuildContext context) {
    double? headersize;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        headersize = 18;
      } else {
        headersize = 9;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        headersize = 16;
      } else {
        headersize = 12;
      }
    }
    return Container(
      padding: EdgeInsets.only(bottom: 5.h),
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(color: Color(kLightGrey.value)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: Color(kBlue.value),
                backgroundImage: const AssetImage("assets/images/face1.jpg"),
              ),
              WidthSpacer(size: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: name,
                    style: appstyle(
                        headersize - 1, Color(kDark.value), FontWeight.normal),
                  ),
                  ReusableText(
                      text: Tno,
                      style: appstyle(headersize - 4, Color(kDarkGrey.value),
                          FontWeight.w300)),
                ],
              ),
            ],
          ),
          ReusableText(
            text: amount,
            style: appstyle(
                headersize - 2, Color(kDarkGrey.value), FontWeight.normal),
          )
        ],
      ),
    );
  }
}
