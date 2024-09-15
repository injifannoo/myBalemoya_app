import 'package:my_balemoya_app/UI/chat/chatsclient.dart';
import 'package:my_balemoya_app/UI/order/client_orders.dart';
import 'package:my_balemoya_app/constants/app_constants.dart';

import 'package:my_balemoya_app/common/app_style.dart';
import 'package:my_balemoya_app/common/custom_btn.dart';
import 'package:my_balemoya_app/common/custom_icon.dart';
import 'package:my_balemoya_app/common/custom_outline_btn.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:my_balemoya_app/common/reusable_text.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileProvider extends StatefulWidget {
  const ProfileProvider({super.key});

  @override
  State<ProfileProvider> createState() => _ProfileProviderState();
}

class _ProfileProviderState extends State<ProfileProvider> {
  List<IconData> rating =
      List<IconData>.generate(5, (index) => Icons.star_border_outlined);

  @override
  Widget build(BuildContext context) {
    double? buttonWidth;
    double? buttonHeight;
    double? iconwidth;
    double? toolbarheight;
    double? headersize;
    double? largebtn;
    double? avatarsize;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        buttonHeight = 31.h;
        toolbarheight = 55.h;
        buttonWidth = 92;
        headersize = 17;
        avatarsize = 30.r;
        iconwidth = 0.08;
        largebtn = sWidth * 0.8;
      } else {
        avatarsize = 60.r;
        buttonHeight = 120.h;
        toolbarheight = 55.h;
        buttonWidth = 92;
        headersize = 10;
        iconwidth = 0.04;
        largebtn = 280;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        buttonWidth = 70;
        avatarsize = 40.r;
        iconwidth = 0.06;
        headersize = 14;
        toolbarheight = 68.h;
        buttonHeight = 22.h;

        largebtn = 290;
      } else {
        avatarsize = 70.r;
        buttonWidth = 70;
        iconwidth = 0.05;
        headersize = 11;
        toolbarheight = 68.h;
        buttonHeight = 40.h;

        largebtn = 290;
      }
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: avatarsize,
                        backgroundImage:
                            const AssetImage("assets/images/worker.jpg"),
                      ),
                      WidthSpacer(size: 16.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: "Addis Mekuriya",
                            style: appstyle(headersize, Color(kDark.value),
                                FontWeight.w400),
                          ),
                          ReusableText(
                            text: "Problem Electricit",
                            style: appstyle(headersize - 3,
                                Color(kDarkGrey.value), FontWeight.w400),
                          ),
                          HeightSpacer(size: 8.h),
                          SizedBox(
                            width: sWidth * 0.6,
                            child: Text(
                              maxLines: 5,
                              "Click here to check client history ",
                              style: appstyle(headersize - 3,
                                  Color(kDarkGrey.value), FontWeight.w400),
                            ),
                          ),
                          CustomOutlineBtn(
                            text: "follow".tr,
                            size: headersize - 1,
                            color: Colors.white,
                            width: buttonWidth,
                            height: buttonHeight,
                            bcolor: Color(kOrange.value),
                          ),
                          HeightSpacer(size: 8.h),
                          ReusableText(
                            text: "Addis Ababa,Ayat",
                            style: appstyle(headersize - 3,
                                Color(kDarkGrey.value), FontWeight.w400),
                          ),
                          HeightSpacer(size: 8.h),
                          Row(
                            children: [
                              ReusableText(
                                text: "6km",
                                style: appstyle(headersize - 3,
                                    Color(kDarkGrey.value), FontWeight.w500),
                              ),
                              WidthSpacer(size: 18.w),
                              ReusableText(
                                text: "online",
                                style: appstyle(headersize - 3,
                                    Color(kDarkGrey.value), FontWeight.w400),
                              ),
                            ],
                          ),
                          HeightSpacer(size: 8.h),
                          Container(
                            child: RatingBar(
                              itemSize: sWidth * iconwidth,
                              initialRating: 3, // starting rating
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full: const CustomIcon(
                                    width: 0.01,
                                    icon: Icons.star,
                                    color: Colors.orange),
                                half: const CustomIcon(
                                    width: 0.01,
                                    icon: Icons.star_half,
                                    color: Colors.orange),
                                empty: const CustomIcon(
                                    width: 0.01,
                                    icon: Icons.star_border_outlined,
                                    color: Colors.orange),
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          HeightSpacer(size: 15.h),
                          SizedBox(
                            width: sWidth * 0.71,
                            child: Row(
                              children: [
                                WidthSpacer(size: 8.w),
                                CustomOutlineBtn(
                                  text: "rateprovider".tr,
                                  size: headersize - 1,
                                  color: Colors.white,
                                  width: buttonWidth + 45,
                                  height: buttonHeight,
                                  bcolor: Color(kOrange.value),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      HeightSpacer(size: 18.h),
      SizedBox(
        height: 21.h,
        child: Container(
          padding: EdgeInsets.only(top: 18.h),
          decoration: BoxDecoration(color: Color(kLightGrey.value)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              text: "myservices".tr,
              style: appstyle(headersize, Color(kDark.value), FontWeight.w400),
            ),
            HeightSpacer(size: 16.h),
            SizedBox(
              width: sWidth * 0.4,
              child: Text(
                  style: appstyle(
                      headersize, Color(kDark.value), FontWeight.normal),
                  "xxxxxxxxxxxxxxxdxxysysysyysysysysysysysysyysysysxxxxxxxxxxxxxxxxxxxxxxxkhdskxxxxyyyyyyyyxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 13.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(kLightGrey.value).withOpacity(0.9),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableText(
              text: "reviews",
              style: appstyle(
                  headersize - 1, Color(kDark.value), FontWeight.normal),
            ),
            CustomIcon(
              width: iconwidth,
              icon: Icons.arrow_forward_ios,
              color: Color(kDarkGrey.value),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  onTap: () {
                    Get.to(const MyChatApp());
                  },
                  text: "chat".tr,
                  size: headersize,
                  fw: FontWeight.normal,
                  width: buttonWidth + 10,
                  height: buttonHeight + 3,
                  bcolor: Color(kOrange.value),
                ),
                WidthSpacer(size: 5.w),
                CustomButton(
                  text: "${"callnow".tr}: +2519.....",
                  size: headersize,
                  fw: FontWeight.normal,
                  width: buttonWidth + 100,
                  height: buttonHeight + 3,
                  bcolor: Color(kBlue.value),
                ),
              ],
            ),
            HeightSpacer(size: 7.h),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ClientOrders();
                    },
                  ),
                );
              },
              text: "ordernow".tr,
              size: headersize + 1,
              fw: FontWeight.w500,
              width: largebtn,
              height: buttonHeight + 5,
              bcolor: Color(kBlue.value),
            ),
          ],
        ),
      ),
    ]);
  }
}
