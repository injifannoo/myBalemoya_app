import 'package:my_balemoya_app/UI/search/widgets/custom_field.dart';
import 'package:my_balemoya_app/common/custom_btn.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifyPassword extends StatefulWidget {
  const VerifyPassword({super.key});

  @override
  State<VerifyPassword> createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
  final TextEditingController Code = TextEditingController();

  @override
  void dispose() {
    Code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double headersize;
    double buttonsize;
    double pagepadding;

    double loginwidth;
    double buttonheight;

    double toolbarheight;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        headersize = 20;
        buttonsize = 400;
        toolbarheight = 55.h;
        pagepadding = 10;
        buttonheight = 60;
      } else {
        buttonheight = 80;
        toolbarheight = 85.h;
        headersize = 11;
        buttonsize = 300;
        pagepadding = 200;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        headersize = 20;
        buttonheight = 60;
        buttonsize = 300;
        pagepadding = 90;
        toolbarheight = 55.h;
      } else {
        toolbarheight = 75.h;
        headersize = 15;
        buttonsize = 300;
        buttonheight = 60;
        pagepadding = 200;
      }
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: toolbarheight,
        centerTitle: true,
        title: Text(
          "verification".tr,
          style: appstyle(headersize, Colors.black, FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: pagepadding),
        child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                const HeightSpacer(size: 50),
                ReusableText(
                    text: "verify".tr,
                    style: appstyle(
                        headersize + 6, Color(kBlue.value), FontWeight.w500)),
                const HeightSpacer(size: 50),
                CustomField(
                  hintText: "code".tr,
                  keyboard: TextInputType.text,
                  controller: Code,
                  validator: (phone) {
                    if (phone!.isEmpty) {
                      return "please enter a valid code";
                    } else {
                      return null;
                    }
                  },
                ),
                const HeightSpacer(size: 20),
                const HeightSpacer(size: 30),
                CustomButton(
                  onTap: () {},
                  text: "verify".tr,
                  size: headersize,
                  fw: FontWeight.normal,
                  width: buttonsize,
                  height: buttonheight,
                  bcolor: Color(kBlue.value),
                ),
                const HeightSpacer(size: 14),
              ],
            )),
      ),
    );
  }
}
