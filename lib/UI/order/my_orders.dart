import 'package:my_balemoya_app/UI/common/exports.dart';
import 'package:my_balemoya_app/UI/order/widgets/order_types.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    double? toolbarheight;
    double? headersize;

    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        toolbarheight = 55.h;

        headersize = 16;
      } else {
        toolbarheight = 75.h;
        headersize = 14;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        headersize = 13;

        toolbarheight = 58.h;
      } else {
        headersize = 13;

        toolbarheight = 58.h;
      }
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: toolbarheight,
        title: ReusableText(
            text: "My Orders",
            style: appstyle(headersize, Colors.black, FontWeight.normal)),
      ),
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            OrderTypes(
                problem: "Fix the pipe",
                image: "assets/images/face1.jpg",
                status: "Completed"),
            OrderTypes(
                problem: "Fixed pipe",
                image: "assets/images/face1.jpg",
                status: "Cancelled"),
            OrderTypes(
                problem: "Fixed pipe",
                image: "assets/images/face1.jpg",
                status: "Pending"),
          ],
        ),
      )),
    );
  }
}
