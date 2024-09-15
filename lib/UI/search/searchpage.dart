import 'package:get/get.dart';
import 'package:my_balemoya_app/common/custom_icon.dart';
import 'package:my_balemoya_app/common/exports.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    double? toolbarheight;
    double? headersize;
    double? iconwidth;
    double? imageWidth;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        toolbarheight = 55.h;
        headersize = 16;
        iconwidth = 0.06;
        imageWidth = sWidth * 0.8;
      } else {
        imageWidth = sWidth * 0.3;
        toolbarheight = 66.h;
        headersize = 12;
        iconwidth = 0.03;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        toolbarheight = 65.h;
        imageWidth = sWidth * 0.8;
        headersize = 13;
        iconwidth = 0.04;
      } else {
        toolbarheight = 55.h;
        headersize = 13;
        imageWidth = sWidth * 0.5;
        iconwidth = 0.03;
      }
    }

    TextEditingController search = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: toolbarheight,
        backgroundColor: Color(kLight.value),
        iconTheme: IconThemeData(color: Color(kDarkGrey.value)),
        title: TextField(
          style: appstyle(headersize, Color(kDark.value), FontWeight.normal),
          decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(kDarkGrey.value))),
            hintText: "searchproviders".tr,
            suffixIcon: CustomIcon(
              width: iconwidth,
              icon: Icons.search,
              color: Color(kDarkGrey.value),
            ),
            suffixIconColor: Color(kLight.value),
            hintStyle:
                appstyle(headersize, Color(kDarkGrey.value), FontWeight.w500),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/optimized_search.png",
                width: imageWidth,
              ),
              ReusableText(
                text: "startsearch".tr,
                style: appstyle(
                    headersize + 1, Color(kDark.value), FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
