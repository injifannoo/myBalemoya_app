import 'package:my_balemoya_app/UI/common/exports.dart';
import 'package:my_balemoya_app/UI/service_provider/service_provider.dart';

import 'package:my_balemoya_app/common/custom_btn.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheetClient extends StatelessWidget {
  const CustomBottomSheetClient(
      {super.key,
      required this.name,
      this.onTap,
      required this.location,
      required this.distance,
      required this.status,
      required this.profession});
  final String name;
  final String profession;
  final String location;
  final String distance;
  final String status;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width <= 500;
    double? padding;
    double? headersize;
    double? btnwidth;
    double? btnheight;
    if (isMobile(context)) {
      padding = 40;
      btnheight = 38;
      headersize = 18;
    } else {
      btnheight = 37;
      padding = 35;
      headersize = 15;
    }

    return Padding(
      padding:
          EdgeInsets.only(top: 20.h, left: padding.w - 25, right: padding.w),
      child: Container(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 35.r,
                      backgroundImage:
                          const AssetImage("assets/images/face1.jpg"),
                    ),
                    const WidthSpacer(size: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: name,
                          style: appstyle(
                              headersize, Color(kDark.value), FontWeight.w400),
                        ),
                        ReusableText(
                          text: profession,
                          style: appstyle(headersize - 2,
                              Color(kDarkGrey.value), FontWeight.normal),
                        ),
                        const HeightSpacer(size: 10),
                        ReusableText(
                          text: location,
                          style: appstyle(headersize - 1,
                              Color(kDarkGrey.value), FontWeight.normal),
                        ),
                        const HeightSpacer(size: 10),
                        Row(
                          children: [
                            ReusableText(
                              text: distance,
                              style: appstyle(headersize - 2,
                                  Color(kDarkGrey.value), FontWeight.normal),
                            ),
                            const WidthSpacer(size: 10),
                            ReusableText(
                              text: status,
                              style: appstyle(headersize - 2,
                                  Color(kDarkGrey.value), FontWeight.normal),
                            ),
                          ],
                        ),
                        HeightSpacer(size: 5.h),
                        const Row(
                          children: [
                            Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            const HeightSpacer(size: 15),
            CustomButton(
              fw: FontWeight.normal,
              size: headersize + 1,
              width: MediaQuery.of(context).size.width * 0.9,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ServiceProvider();
                    },
                  ),
                );
              },
              height: btnheight,
              text: "More Information",
              color: Color(kLight.value),
              bcolor: (Color(kBlue.value)),
            )
          ],
        ),
      ),
    );
  }
}
