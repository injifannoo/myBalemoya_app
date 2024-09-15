import 'package:my_balemoya_app/common/custom_icon.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double? iconwidth;
    double? toolbarheight;
    double? headersize;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width <= 500;
    if (isMobile(context)) {
      toolbarheight = 55.h;

      headersize = 16;
      iconwidth = 0.06;
    } else {
      iconwidth = 0.05;
      headersize = 13;
      toolbarheight = 58.h;
    }
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: toolbarheight,
          centerTitle: true,
          title: ReusableText(
              text: "Messages",
              style: appstyle(headersize, Colors.black, FontWeight.normal)),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.h),
              child: Row(
                children: [
                  CustomIcon(
                    width: iconwidth,
                    icon: Icons.star_border,
                    color: Colors.black,
                  ),
                  WidthSpacer(size: 10.w),
                ],
              ),
            )
          ],
        ),
        body: Container());
  }
}
