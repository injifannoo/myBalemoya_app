import 'package:get/get.dart';
import 'package:my_balemoya_app/common/custom_icon.dart';
import 'package:my_balemoya_app/UI/service_provider/service_provider.dart';
import 'package:my_balemoya_app/common/custom_btn.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet(
      {super.key,
      required this.name,
      this.onTap,
      required this.location,
      required this.distance,
      required this.status,
      required this.problem});
  final String name;
  final String problem;
  final String location;
  final String distance;
  final String status;
  final void Function()? onTap;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    double? padding;
    double? headersize;
    double? btnwidth;
    double? btnheight;
    double? iconwidth;
    double? avatarsize;

    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        avatarsize = 35.r;
        padding = 35;
        btnheight = 38;
        headersize = 18;
        iconwidth = 0.06;
      } else {
        avatarsize = 42.r;
        padding = 35;
        btnheight = 75;
        headersize = 11;
        iconwidth = 0.04;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        avatarsize = 35.r;
        btnheight = 37;
        padding = 30;
        headersize = 15;
        iconwidth = 0.05;
      } else {
        avatarsize = 40.r;
        btnheight = 50;
        padding = 30;
        headersize = 8;
        iconwidth = 0.03;
      }
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
                      radius: avatarsize,
                      backgroundImage:
                          const AssetImage("assets/images/worker.jpg"),
                    ),
                    const WidthSpacer(size: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: widget.name,
                          style: appstyle(
                              headersize, Color(kDark.value), FontWeight.w400),
                        ),
                        ReusableText(
                          text: widget.problem,
                          style: appstyle(headersize - 2,
                              Color(kDarkGrey.value), FontWeight.normal),
                        ),
                        const HeightSpacer(size: 10),
                        ReusableText(
                          text: widget.location,
                          style: appstyle(headersize - 1,
                              Color(kDarkGrey.value), FontWeight.normal),
                        ),
                        const HeightSpacer(size: 10),
                        Row(
                          children: [
                            ReusableText(
                              text: widget.distance,
                              style: appstyle(headersize - 2,
                                  Color(kDarkGrey.value), FontWeight.normal),
                            ),
                            const WidthSpacer(size: 10),
                            ReusableText(
                              text: widget.status,
                              style: appstyle(headersize - 2,
                                  Color(kDarkGrey.value), FontWeight.normal),
                            ),
                          ],
                        ),
                        const HeightSpacer(size: 5),
                        Container(
                          child: RatingBar(
                            itemSize:
                                MediaQuery.of(context).size.width * iconwidth,
                            initialRating: 3, // starting rating
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              full: const CustomIcon(
                                  width: 2,
                                  icon: Icons.star,
                                  color: Colors.orange),
                              half: CustomIcon(
                                  width: iconwidth - 0.02,
                                  icon: Icons.star_half,
                                  color: Colors.orange),
                              empty: CustomIcon(
                                  width: iconwidth - 0.02,
                                  icon: Icons.star_border_outlined,
                                  color: Colors.orange),
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
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
              width: MediaQuery.of(context).size.width * 0.8,
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
              text: "moreinformation".tr,
              color: Color(kLight.value),
              bcolor: (Color(kOrange.value)),
            )
          ],
        ),
      ),
    );
  }
}

// }
//  Padding(
//       padding: EdgeInsets.only(top: 20, left: 40, right: 40),
//       child: Container(
//         padding: EdgeInsets.zero,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CircleAvatar(
//                       radius: 35,
//                       backgroundImage: AssetImage("assets/images/face1.jpg"),
//                     ),
//                     WidthSpacer(size: 16),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ReusableText(
//                           text: name,
//                           style:
//                               appstyle(19, Color(kDark.value), FontWeight.w400),
//                         ),
//                         ReusableText(
//                           text: problem,
//                           style: appstyle(
//                               15, Color(kDarkGrey.value), FontWeight.w500),
//                         ),
//                         HeightSpacer(size: 10),
//                         ReusableText(
//                           text: location,
//                           style: appstyle(
//                               15, Color(kDarkGrey.value), FontWeight.w500),
//                         ),
//                         HeightSpacer(size: 10),
//                         Row(
//                           children: [
//                             ReusableText(
//                               text: distance,
//                               style: appstyle(
//                                   15, Color(kDarkGrey.value), FontWeight.w500),
//                             ),
//                             WidthSpacer(size: 10),
//                             ReusableText(
//                               text: status,
//                               style: appstyle(
//                                   15, Color(kDarkGrey.value), FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                         HeightSpacer(size: 5),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.star_border,
//                               color: Colors.yellow,
//                             ),
//                             Icon(
//                               Icons.star_border,
//                               color: Colors.yellow,
//                             ),
//                             Icon(
//                               Icons.star_border,
//                               color: Colors.yellow,
//                             ),
//                             Icon(
//                               Icons.star_border,
//                               color: Colors.yellow,
//                             ),
//                             Icon(
//                               Icons.star_border,
//                               color: Colors.yellow,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             HeightSpacer(size: 15),
//             CustomButton(
//               fw: FontWeight.normal,
//               size: 20,
//               width: double.infinity,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return ServiceProvider();
//                     },
//                   ),
//                 );
//               },
//               height: 40,
//               text: "More Information",
//               color: Color(kLight.value),
//               bcolor: (Color(kBlue.value)),
//             )
//           ],
//         ),
//       ),
//     );