import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:my_balemoya_app/common/custom_btn.dart';

import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  Future<void> _activateLocation(BuildContext context) async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        // Use the position for further actions (e.g., displaying on the map)
        print('Location: ${position.latitude}, ${position.longitude}');
      } catch (e) {
        // Handle location retrieval errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to get location: $e')),
        );
      }
    } else {
      // Handle permission denied scenario
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission denied')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // UI code remains the same as your provided snippet
    double? iconWidth;
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
        iconWidth = sWidth / 50;
        headersize = 24;
        buttonWidth = sWidth * 0.7;
        buttonHeight = 50;
      } else {
        iconWidth = sWidth / 50;
        headersize = 17;
        buttonWidth = sWidth * 0.2;
        buttonHeight = 80;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        iconWidth = sWidth / 50;
        headersize = 20;
        buttonWidth = sWidth * 0.3;
        buttonHeight = 45;
      } else {
        buttonWidth = sWidth * 0.2;
        buttonHeight = 65;
        iconWidth = sWidth / 50;
        headersize = 18;
      }
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/Y2location.png",
                width: 250.w,
                height: 250.h,
              ),
              HeightSpacer(size: 20.h),
              Column(
                children: [
                  ReusableText(
                      text: "Activate the place",
                      style: appstyle(
                          headersize, Color(kBlue.value), FontWeight.normal)),
                  HeightSpacer(size: 10.h),
                  Container(
                      child: Text(
                          textAlign: TextAlign.center,
                          "You can now specify your address to deliver your orders and see which payment method is right for you",
                          style: appstyle(headersize - 10, Color(kBlue.value),
                              FontWeight.normal))),
                  const HeightSpacer(size: 50),
                  CustomButton(
                    text: "Activate",
                    size: headersize - 5,
                    fw: FontWeight.normal,
                    width: buttonWidth,
                    height: buttonHeight,
                    bcolor: Color(kOrange.value),
                    onTap: () => _activateLocation(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
