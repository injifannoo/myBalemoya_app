import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_balemoya_app/UI/auth/login.dart';
import 'package:my_balemoya_app/UI/map/mapview_page.dart';
import 'package:my_balemoya_app/constants/app_constants.dart';
import 'package:my_balemoya_app/common/custom_btn.dart';
import 'package:my_balemoya_app/common/custom_icon.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';
import 'package:my_balemoya_app/common/bottom_sheet.dart';
import 'package:my_balemoya_app/data/providermock_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double? containerheight;
    double? nearbyContainerWidth;
    double? nearbyContainerheight;
    double? loginWidth;
    double? iconWidth;
    double? toolbarheight;
    double? loginHeight;
    double? imageWidth;
    double? headersize;
    double? buttonWidth;
    double? buttonHeight;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;

    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        nearbyContainerWidth = 210.w;
        nearbyContainerheight = 65.h;
        toolbarheight = 55.h;
        loginWidth = 92;
        headersize = 16;
        iconWidth = 0.06;
        containerheight = 300.h;
        loginHeight = 33;
      } else {
        nearbyContainerWidth = 140.w;
        nearbyContainerheight = 125.h;
        loginHeight = 64;
        toolbarheight = 84.h;
        loginWidth = 62;
        headersize = 10;
        iconWidth = 0.03;
        containerheight = 300.h;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        nearbyContainerWidth = 210.w;
        nearbyContainerheight = 65.h;
        loginHeight = 31;
        iconWidth = sWidth / 55;
        headersize = 20;
        buttonWidth = sWidth * 0.3;
        buttonHeight = 45;

        loginWidth = 72;
        iconWidth = 0.05;
        headersize = 13;
        toolbarheight = 58.h;
        containerheight = 290.h;
      } else {
        nearbyContainerWidth = 150.w;
        nearbyContainerheight = 95.h;
        loginHeight = 51;
        iconWidth = sWidth / 55;
        headersize = 18;
        buttonWidth = sWidth * 0.3;
        buttonHeight = 45;

        loginWidth = 72;
        iconWidth = 0.035;
        headersize = 10;
        toolbarheight = 65.h;
        containerheight = 290.h;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: toolbarheight,
        automaticallyImplyLeading: false,
        leading: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset("assets/images/logo.png")),
        leadingWidth: 200,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WidthSpacer(size: 30.w),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
                text: "login".tr,
                size: headersize,
                fw: FontWeight.w400,
                width: loginWidth,
                height: loginHeight,
                bcolor: Color(kBlue.value),
              ),
              WidthSpacer(size: 10.w),
              CustomIcon(
                width: iconWidth,
                icon: Icons.notifications_active,
                color: Colors.black,
              ),
              WidthSpacer(size: 10.w)
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Pass the callback to display the bottom sheet
            MapviewPage(
              serviceProviders: mockServiceProviders,
              onMarkerTapped: (provider) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Wrap(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.white,
                          child: CustomBottomSheet(
                            name: provider.fullName,
                            problem: provider.serviceType,
                            location: provider.locationDescription,
                            distance:
                                "N/A", // You can calculate distance if needed
                            status: provider.status,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
