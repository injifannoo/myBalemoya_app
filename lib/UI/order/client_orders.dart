import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_balemoya_app/UI/order/posted_order.dart';
import 'package:my_balemoya_app/common/custom_btn.dart';
import 'package:my_balemoya_app/common/custom_icon.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';

class ClientOrders extends StatelessWidget {
  const ClientOrders({super.key});

  @override
  Widget build(BuildContext context) {
    double? buttonWidth;
    double? buttonHeight;
    double? iconwidth;
    double? toolbarheight;
    double? headersize;
    double imagewidth;

    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        buttonHeight = 30.h;
        toolbarheight = 55.h;
        buttonWidth = 92;
        headersize = 17;
        iconwidth = 0.06;
        imagewidth = sWidth * 0.9;
      } else {
        buttonHeight = 145.h;
        toolbarheight = 55.h;
        buttonWidth = 55;
        headersize = 10;
        iconwidth = 0.03;
        imagewidth = sWidth * 0.3;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        imagewidth = sWidth * 0.9;
        buttonWidth = 72;
        iconwidth = 0.05;
        headersize = 13;
        toolbarheight = 58.h;
        buttonHeight = 26.h;
      } else {
        imagewidth = sWidth * 0.3;
        buttonWidth = 72;
        iconwidth = 0.04;
        headersize = 12;
        toolbarheight = 58.h;
        buttonHeight = 70.h;
      }
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: ReusableText(
            text: "Client orders",
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
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    width: imagewidth,
                    height: 200.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image.asset(
                        "assets/images/broken.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const HeightSpacer(size: 20),
                  ReusableText(
                    text: "Choose timing",
                    style: appstyle(
                        headersize + 2, Colors.black, FontWeight.normal),
                  ),
                  const HeightSpacer(size: 6),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: CustomIcon(
                            width: iconwidth,
                            icon: Icons.check_circle,
                            color: Color(kOrange.value),
                          ),
                        ),
                        const WidgetSpan(child: WidthSpacer(size: 5)),
                        TextSpan(
                            text: "according to time",
                            style: appstyle(headersize + 1, Colors.black,
                                FontWeight.normal))
                      ],
                    ),
                  ),
                  const HeightSpacer(size: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(235, 255, 255, 255),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(kDarkGrey.value))),
                              hintText: "12:00PM",
                              hintStyle: appstyle(headersize - 1,
                                  Color(kDarkGrey.value), FontWeight.normal),
                              suffixIconColor: Color(kDarkGrey.value),
                              suffixIcon: CustomIcon(
                                width: iconwidth,
                                icon: Icons.watch_later_outlined,
                                color: Color(kDarkGrey.value),
                              )),
                        ),
                      ),
                      const WidthSpacer(size: 15),
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(235, 255, 255, 255),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(kDarkGrey.value))),
                              hintText: "Today",
                              hintStyle: appstyle(headersize - 1,
                                  Color(kDarkGrey.value), FontWeight.normal),
                              suffixIconColor: Color(kDarkGrey.value),
                              suffixIcon: CustomIcon(
                                width: iconwidth,
                                icon: Icons.calendar_today,
                                color: Color(kDarkGrey.value),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const HeightSpacer(size: 5),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(235, 255, 255, 255),
                        border: Border.all(color: Color(kDarkGrey.value))),
                    width: double.infinity,
                    child: Text(
                      overflow: null,
                      "sssssssssssssssssssddddddddddddsdsdsdsddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddsss",
                      style: appstyle(headersize - 2, Color(kDarkGrey.value),
                          FontWeight.normal),
                    ),
                  ),
                  const HeightSpacer(size: 20),
                  CustomButton(
                    onTap: () {
                      Get.to(const PostedOrders());
                    },
                    text: "Accept Order",
                    size: headersize + 1,
                    fw: FontWeight.w500,
                    width: sWidth * 0.6,
                    height: buttonHeight + 5,
                    bcolor: Color(kBlue.value),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
