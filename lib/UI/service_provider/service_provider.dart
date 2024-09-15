import 'package:get/get.dart';
import 'package:my_balemoya_app/UI/service_provider/widgets/profile_client.dart';

import 'package:my_balemoya_app/common/custom_icon.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceProvider extends StatefulWidget {
  const ServiceProvider({super.key});

  @override
  State<ServiceProvider> createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  @override
  Widget build(BuildContext context) {
    double buttonWidth;
    double? iconwidth;
    double? toolbarheight;
    double? headersize;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        toolbarheight = 55.h;
        buttonWidth = 92;
        headersize = 16;
        iconwidth = 0.06;
      } else {
        toolbarheight = 75.h;
        buttonWidth = 92;
        headersize = 13;
        iconwidth = 0.03;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        buttonWidth = 72;
        iconwidth = 0.05;
        headersize = 13;
        toolbarheight = 54.h;
      } else {
        buttonWidth = 72;
        iconwidth = 0.05;
        headersize = 13;
        toolbarheight = 80.h;
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: toolbarheight,
        centerTitle: true,
        title: ReusableText(
            text: "provider".tr,
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
                CustomIcon(
                  width: iconwidth,
                  icon: Icons.chat_bubble_outline,
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
      body: ListView(children: const [ProfileProvider(), Text("")]),
    );
  }
}
