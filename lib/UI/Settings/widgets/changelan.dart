import 'package:get/get.dart';

import 'package:my_balemoya_app/common/exports.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    double loginWidth;
    double? iconwidth;
    double? toolbarheight;
    double? headersize;

    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        toolbarheight = 55.h;
        loginWidth = 92;
        headersize = 16;
        iconwidth = 0.06;
      } else {
        toolbarheight = 55.h;
        loginWidth = 92;
        headersize = 11;
        iconwidth = 0.06;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        loginWidth = 72;
        iconwidth = 0.05;
        headersize = 13;
        toolbarheight = 58.h;
      } else {
        loginWidth = 72;
        iconwidth = 0.05;
        headersize = 13;
        toolbarheight = 58.h;
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: toolbarheight,
        automaticallyImplyLeading: false,
        title: ReusableText(
            text: "hello".tr,
            style: appstyle(headersize, Colors.black, FontWeight.normal)),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                var locale = const Locale("amh", "ET");
                Get.updateLocale(locale);
              },
              child: const Text("Change to amh")),
          ElevatedButton(
              onPressed: () {
                var locale = const Locale("en", "US");
                Get.updateLocale(locale);
              },
              child: const Text("Change to eng"))
        ],
      ),
    );
  }
}
