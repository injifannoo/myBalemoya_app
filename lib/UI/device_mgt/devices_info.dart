import 'package:my_balemoya_app/UI/device_mgt/widgets/device_info.dart';
import 'package:my_balemoya_app/UI/splash/splash_screen.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:my_balemoya_app/controllers/exports.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DeviceManagement extends StatelessWidget {
  const DeviceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    String date = DateTime.now().toString();
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    var onBoardNotifier = Provider.of<OnBoardNotifier>(context);

    var loginDate = date.substring(0, 11);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          title: const Text("Device managment"),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpacer(size: 50),
                  Text(
                    "You are logged in into your account on these devices",
                    style: appstyle(16, Color(kDark.value), FontWeight.normal),
                  ),
                  const HeightSpacer(size: 50),
                  DeviceInfo(
                      location: "Washington DC",
                      device: "MacBook M2",
                      platform: "Apple Webkit",
                      date: loginDate,
                      ipAddress: "10.0.12.000"),
                  const HeightSpacer(size: 50),
                  DeviceInfo(
                      location: "Brooklyn",
                      device: "iphone 14",
                      platform: "Mobile App",
                      date: loginDate,
                      ipAddress: "10.0.12.000"),
                ],
              ),
            ),
            Consumer<LoginNotifier>(
              builder: (context, LoginNotifier, child) {
                return Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        onBoardNotifier.isLastPage = false;
                        zoomNotifier.currentIndex = 0;
                        Get.to(() => const SplashScreen());
                      },
                      child: ReusableText(
                        text: "Sign out from all devices",
                        style:
                            appstyle(16, Color(kOrange.value), FontWeight.w600),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
