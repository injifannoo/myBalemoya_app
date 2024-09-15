import 'package:my_balemoya_app/UI/card/add_card.dart';
import 'package:my_balemoya_app/UI/editable/profile_edit.dart';

import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String description =
      "I am an electrician with a lot of experience in which i worked for almost 10 years.";
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double? headersize;
    double? iconwidth;
    double? avatarwidth;
    double? toolbarheight;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        headersize = 18;
        iconwidth = 0.06;
        toolbarheight = 55.h;
        avatarwidth = 40.r;
      } else {
        avatarwidth = 60.r;
        headersize = 11;
        iconwidth = 0.03;
        toolbarheight = 55.h;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        avatarwidth = 40.r;
        headersize = 14;
        iconwidth = 0.05;
        toolbarheight = 55.h;
      } else {
        avatarwidth = 60.r;
        headersize = 15;
        iconwidth = 0.05;
        toolbarheight = 55.h;
      }
    }
    Icon man = Icon(
      Icons.person_outlined,
      size: MediaQuery.of(context).size.width * iconwidth,
      color: Color(kOrange.value),
    );
    Icon location2 = Icon(
      Icons.location_on_outlined,
      size: MediaQuery.of(context).size.width * iconwidth,
      color: Color(kOrange.value),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: toolbarheight,
        centerTitle: true,
        title: Text(
          "myaccount".tr,
          style: appstyle(headersize, Colors.black, FontWeight.normal),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const ProfileEdit();
                  },
                ),
              );
            },
            child: Text(
              "Edit  ",
              style: appstyle(headersize, Color(kDark.value), FontWeight.w400),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: avatarwidth,
                      backgroundImage:
                          const AssetImage("assets/images/worker.jpg"),
                    ),
                    const WidthSpacer(size: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            man,
                            ReusableText(
                              text: "Yohanes",
                              style: appstyle(headersize + 2,
                                  Color(kDark.value), FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            location2,
                            ReusableText(
                              text: "location",
                              style: appstyle(headersize - 2,
                                  Color(kDarkGrey.value), FontWeight.normal),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const HeightSpacer(size: 15),
                Container(
                  decoration: BoxDecoration(
                      color: Color(kLightGrey.value),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        maxLines: _isExpanded ? null : 5,
                        overflow: TextOverflow.ellipsis,
                        style: appstyle(headersize - 4, Color(kDark.value),
                            FontWeight.normal),
                      ),
                      InkWell(
                        child: Text(
                          _isExpanded ? 'Show more' : 'Show less',
                          style: appstyle(
                              headersize - 2, Colors.blue, FontWeight.w400),
                        ),
                        onTap: () {
                          setState(
                            () {
                              _isExpanded = !_isExpanded;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              ReusableText(
                  text: "accountinfo".tr,
                  style: appstyle(
                      headersize + 1, Color(kDark.value), FontWeight.w400)),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(kDarkGrey.value)),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "location".tr,
                        style: appstyle(headersize - 1, Color(kDark.value),
                            FontWeight.w400),
                      ),
                      ReusableText(
                        text: "xxxxx",
                        style: appstyle(headersize - 5, Color(kDarkGrey.value),
                            FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const HeightSpacer(size: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(kDarkGrey.value)),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "orderhistory".tr,
                        style: appstyle(headersize - 1, Color(kDark.value),
                            FontWeight.w400),
                      ),
                      ReusableText(
                        text: "xxxxx",
                        style: appstyle(headersize - 5, Color(kDarkGrey.value),
                            FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const HeightSpacer(size: 10),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(kDarkGrey.value)),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "language".tr,
                        style: appstyle(headersize - 2, Color(kDark.value),
                            FontWeight.w400),
                      ),
                      ReusableText(
                        text: "xxxxx",
                        style: appstyle(headersize - 5, Color(kDarkGrey.value),
                            FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ReusableText(
                    text: "payment".tr,
                    style: appstyle(
                        headersize - 1, Color(kDark.value), FontWeight.w400)),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(kDarkGrey.value)),
                  ),
                ),
                child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.card_giftcard,
                              size:
                                  MediaQuery.of(context).size.width * iconwidth,
                            ),
                            const WidthSpacer(size: 10),
                            Column(
                              children: [
                                ReusableText(
                                  text: "visacard".tr,
                                  style: appstyle(headersize - 2,
                                      Color(kDark.value), FontWeight.w400),
                                ),
                                ReusableText(
                                  text: "addcard".tr,
                                  style: appstyle(headersize - 4,
                                      Color(kDarkGrey.value), FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(kDarkGrey.value)),
                  ),
                ),
                child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.to(const AddCard());
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  size: MediaQuery.of(context).size.width *
                                      iconwidth,
                                  color: Color(kOrange.value),
                                )),
                            const WidthSpacer(size: 10),
                            Column(
                              children: [
                                ReusableText(
                                  text: "addcard".tr,
                                  style: appstyle(headersize - 2,
                                      Color(kDark.value), FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
