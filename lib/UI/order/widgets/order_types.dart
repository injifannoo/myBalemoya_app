import 'package:my_balemoya_app/common/custom_icon.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTypes extends StatelessWidget {
  const OrderTypes(
      {super.key,
      required this.problem,
      required this.image,
      required this.status});
  final String problem;
  final String image;
  final String status;
  @override
  Widget build(BuildContext context) {
    double? iconwidth;
    double? avatarsize;
    double? headersize;

    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        headersize = 16;
        avatarsize = 20.r;
        iconwidth = 0.06;
      } else {
        headersize = 11;
        iconwidth = 0.03;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        iconwidth = 0.05;
        headersize = 11;
        avatarsize = 20.r;
      } else {
        iconwidth = 0.03;
        headersize = 8;
        avatarsize = 40.r;
      }
    }
    Widget? statusIcon;
    Widget? statusText;
    if (status == "Pending") {
      statusIcon = CustomIcon(
        width: iconwidth,
        icon: Icons.watch_later_outlined,
        color: Colors.yellow,
      );
      statusText = ReusableText(
          text: "Pending",
          style: appstyle(headersize, Colors.black, FontWeight.normal));
    } else if (status == "Completed") {
      statusIcon = CustomIcon(
        width: iconwidth,
        icon: Icons.check,
        color: Colors.green,
      );
      statusText = ReusableText(
          text: "Completed",
          style: appstyle(headersize, Colors.black, FontWeight.normal));
    } else if (status == "Cancelled") {
      statusIcon = CustomIcon(
        width: iconwidth,
        icon: Icons.exit_to_app,
        color: Colors.red,
      );
      statusText = ReusableText(
          text: "Cancelled",
          style: appstyle(headersize, Colors.black, FontWeight.normal));
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: ReusableText(
                  text: problem,
                  style: appstyle(
                      headersize - 1, Colors.black, FontWeight.normal)),
              subtitle: Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: avatarsize,
                    child: ClipOval(
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  statusIcon!,
                  const WidthSpacer(size: 12),
                  statusText!,
                  const WidthSpacer(size: 12),
                  CustomIcon(
                    width: iconwidth,
                    icon: Icons.arrow_forward_ios_rounded,
                    color: Color(kDarkGrey.value),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
