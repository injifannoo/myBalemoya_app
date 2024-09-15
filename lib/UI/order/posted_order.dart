import 'package:my_balemoya_app/UI/order/my_orders.dart';
import 'package:my_balemoya_app/UI/order/widgets/applicants.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostedOrders extends StatefulWidget {
  const PostedOrders({super.key});

  @override
  State<PostedOrders> createState() => _PostedOrdersState();
}

class _PostedOrdersState extends State<PostedOrders> {
  @override
  Widget build(BuildContext context) {
    double? mediawidth;
    double? describewidth;
    double? describeheight;
    double buttonWidth;
    double buttonHeight;
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
        buttonWidth = 150.w;
        buttonHeight = 38.h;
        headersize = 16;
        iconwidth = 0.06;
        mediawidth = 320.w;
      } else {
        toolbarheight = 70.h;
        buttonWidth = 150.w;
        buttonHeight = 38.h;
        headersize = 10;
        iconwidth = 0.06;
        mediawidth = 110.w;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        buttonWidth = 130.w;
        iconwidth = 0.05;
        headersize = 13;
        buttonHeight = 32.h;
        toolbarheight = 58.h;
        mediawidth = 260.w;
      } else {
        buttonWidth = 130.w;
        iconwidth = 0.05;
        headersize = 11;
        buttonHeight = 32.h;
        toolbarheight = 58.h;
        mediawidth = 170.w;
      }
    }
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
            style: ButtonStyle(
                padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 15, horizontal: 34)),
                backgroundColor: WidgetStatePropertyAll(Color(kBlue.value))),
            onPressed: () {
              Get.to(const MyOrders());
            },
            child: Text(
              "Apply to this",
              style: appstyle(headersize + 4, Colors.white, FontWeight.normal),
            )),
      ),
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: toolbarheight,
        title: ReusableText(
            text: "Orders",
            style: appstyle(headersize, Colors.black, FontWeight.normal)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/broken.jpg",
                  width: mediawidth,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HeightSpacer(size: 8),
                    ReusableText(
                      text: "Fix the water faucet",
                      style: appstyle(
                          headersize + 4, Colors.black, FontWeight.w400),
                    ),
                    const HeightSpacer(size: 10),
                    SizedBox(
                      child: Text(
                          overflow: null,
                          "i have a brass faucet with a huge problem and there is a terrible slope of water. i hope for those who have solutions attached to you a video of the problem thank you",
                          style: appstyle(headersize - 2, Color(kDark.value),
                              FontWeight.normal)),
                    ),
                    const HeightSpacer(size: 20),
                    ReusableText(
                      text: "Applicants for this problem  ",
                      style: appstyle(
                          headersize + 4, Colors.black, FontWeight.w400),
                    ),
                    const HeightSpacer(size: 15),
                    const Applicants(
                      image: "assets/images/face1.jpg",
                      name: "Seid",
                      rating: "5",
                      ratingcount: "344",
                    ),
                    const Applicants(
                      image: "assets/images/worker.jpg",
                      name: "Belete",
                      rating: "3.5",
                      ratingcount: "43",
                    ),
                    const Applicants(
                      image: "assets/images/worker.jpg",
                      name: "Belete",
                      rating: "3.5",
                      ratingcount: "43",
                    ),
                    const Applicants(
                      image: "assets/images/worker.jpg",
                      name: "Belete",
                      rating: "3.5",
                      ratingcount: "43",
                    ),
                    const Applicants(
                      image: "assets/images/worker.jpg",
                      name: "Belete",
                      rating: "3.5",
                      ratingcount: "43",
                    ),
                    const Applicants(
                      image: "assets/images/worker.jpg",
                      name: "Belete",
                      rating: "3.5",
                      ratingcount: "43",
                    ),
                    const Applicants(
                      image: "assets/images/worker.jpg",
                      name: "Belete",
                      rating: "3.5",
                      ratingcount: "43",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
