import 'package:get/get.dart';
import 'package:my_balemoya_app/UI/Settings/widgets/changelan.dart';
import 'package:my_balemoya_app/UI/device_mgt/devices_info.dart';

import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/setting_containers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
            text: "Settings",
            style: appstyle(headersize, Colors.black, FontWeight.normal)),
      ),
      body: Column(
        children: [
          SettingsContainer(name: "WishList", onTap: () {}),
          SettingsContainer(
              name: "Device Managment",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const DeviceManagement();
                  },
                ));
              }),
          SettingsContainer(
              name: "Settings",
              onTap: () {
                Get.to(const ChangeLanguage());
              }),
          SettingsContainer(name: "Find The Nearest", onTap: () {}),
          SettingsContainer(name: "About", onTap: () {}),
        ],
      ),
    );
  }
}
