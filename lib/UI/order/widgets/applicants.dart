import 'package:my_balemoya_app/common/custom_icon.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Applicants extends StatelessWidget {
  const Applicants(
      {super.key,
      required this.image,
      required this.name,
      required this.rating,
      required this.ratingcount});
  final String image;
  final String name;
  final String rating;
  final String ratingcount;
  @override
  Widget build(BuildContext context) {
    double? mediawidth;
    double? describewidth;
    double? describeheight;
    double buttonWidth;
    double buttonHeight;
    double? iconwidth;
    double? imagewidth;
    double? headersize;

    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        imagewidth = 1.1;
        buttonWidth = 150.w;
        buttonHeight = 35.h;
        headersize = 16;
        iconwidth = 0.06;
        mediawidth = 320.w;
      } else {
        imagewidth = 1.4;
        buttonWidth = 150.w;
        buttonHeight = 35.h;
        headersize = 10;
        iconwidth = 0.04;
        mediawidth = 320.w;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        buttonWidth = 130.w;
        iconwidth = 0.05;
        headersize = 13;
        buttonHeight = 32.h;
        imagewidth = 1;
        mediawidth = 260.w;
      } else {
        buttonWidth = 130.w;
        iconwidth = 0.05;
        headersize = 13;
        buttonHeight = 32.h;
        imagewidth = 1.1;
        mediawidth = 260.w;
      }
    }

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Transform.scale(
        scale: imagewidth,
        child: CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
      ),
      title: ReusableText(
          text: name,
          style: appstyle(headersize + 2, Colors.black, FontWeight.w400)),
      subtitle: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: CustomIcon(
                width: iconwidth,
                icon: Icons.star,
                color: const Color.fromARGB(255, 203, 185, 26),
              ),
            ),
            TextSpan(
                text: " $rating ($ratingcount)",
                style:
                    appstyle(headersize - 1, Colors.black, FontWeight.normal))
          ],
        ),
      ),
      trailing: Transform.scale(
          scale: 1.4,
          child: Container(
              child: const Radio(
            value: 1,
            groupValue: 1,
            onChanged: null,
          ))),
    );
  }
}
