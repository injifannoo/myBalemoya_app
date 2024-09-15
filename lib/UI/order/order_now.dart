import 'dart:async';

import 'package:my_balemoya_app/UI/common/exports.dart';
import 'package:my_balemoya_app/UI/order/my_orders.dart';
import 'package:my_balemoya_app/UI/order/posted_order.dart';
import 'package:my_balemoya_app/UI/order/widgets/add_image.dart';
import 'package:my_balemoya_app/common/custom_btn.dart';
import 'package:my_balemoya_app/common/custom_icon.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderNow extends StatefulWidget {
  const OrderNow({super.key});

  @override
  State<OrderNow> createState() => _OrderNowState();
}

class _OrderNowState extends State<OrderNow> {
  final _problemController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  int _selectedValue = 1;
  @override
  void dispose() {
    _problemController.dispose();
    super.dispose();
  }

  @override
  void _submitBio() {
    // Handle the submission logic here
    print('Submitted Problem: ${_problemController.text}');
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      setState(() {
        _dateController.text = pickedDate.toString();
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (pickedTime != null) {
      _timeController.text = pickedTime.format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double? describewidth;
    double? describeheight;
    double buttonWidth;
    double buttonHeight;
    double? iconwidth;
    double? toolbarheight;
    double? headersize;
    double? radioscale;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        toolbarheight = 55.h;
        radioscale = 1.3;
        buttonWidth = 150.w;
        buttonHeight = 38.h;
        headersize = 16;
        iconwidth = 0.06;
      } else {
        toolbarheight = 55.h;
        buttonWidth = 60.w;
        buttonHeight = 118.h;
        headersize = 9;
        radioscale = 1.1;
        iconwidth = 0.03;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        buttonWidth = 110.w;
        iconwidth = 0.05;
        headersize = 13;
        radioscale = 1.3;
        buttonHeight = 26.h;
        toolbarheight = 58.h;
      } else {
        buttonWidth = 60.w;
        iconwidth = 0.04;
        headersize = 11;
        radioscale = 1.3;
        buttonHeight = 65.h;
        toolbarheight = 58.h;
      }
    }
    Widget content = _selectedValue == 1
        ? ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.85),
            child: Column(
              children: <Widget>[
                TextFormField(
                  style:
                      appstyle(headersize - 2, Colors.black, FontWeight.normal),
                  controller: _problemController,
                  decoration: InputDecoration(
                    labelText: 'Describe the problem',
                    labelStyle: appstyle(
                        headersize - 1, Colors.black38, FontWeight.normal),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white60,
                  ),
                  maxLines: null,
                  maxLength: 100, // Allows for multi-line input
                ),
                const SizedBox(height: 10),
                CustomButton(
                    onTap: () {
                      Get.to(const PostedOrders());
                    },
                    bcolor: Color(kBlue.value),
                    color: Colors.white,
                    text: "Send Order",
                    size: headersize + 2,
                    fw: FontWeight.normal,
                    width: buttonWidth,
                    height: buttonHeight)
              ],
            ),
          )
        : ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.85),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _dateController,
                        onTap: () {
                          _selectDate();
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: _dateController.text.isEmpty
                              ? "Date"
                              : _dateController.text,
                          labelStyle: appstyle(headersize,
                              Color(kDarkGrey.value), FontWeight.normal),
                          filled: true,
                          fillColor: Colors.white60,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: CustomIcon(
                            width: iconwidth,
                            icon: Icons.calendar_today,
                            color: Color(kDarkGrey.value),
                          ),
                        ),
                      ),
                    ),
                    const WidthSpacer(size: 10),
                    Expanded(
                      child: TextField(
                        controller: _timeController,
                        onTap: () {
                          _selectTime();
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: _timeController.text.isEmpty
                              ? "Time"
                              : _timeController.text,
                          labelStyle: appstyle(headersize,
                              Color(kDarkGrey.value), FontWeight.normal),
                          filled: true,
                          fillColor: Colors.white60,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: CustomIcon(
                            width: iconwidth,
                            icon: Icons.timer,
                            color: Color(kDarkGrey.value),
                          ),
                        ),
                      ),
                    ),
                    const HeightSpacer(size: 20)
                  ],
                ),
                const HeightSpacer(size: 20),
                TextFormField(
                  style:
                      appstyle(headersize - 2, Colors.black, FontWeight.normal),
                  controller: _problemController,
                  decoration: InputDecoration(
                    labelText: 'Describe the problem',
                    labelStyle: appstyle(
                        headersize - 1, Colors.black38, FontWeight.normal),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white60,
                  ),
                  maxLines: null,
                  maxLength: 100, // Allows for multi-line input
                ),
                const SizedBox(height: 10),
                CustomButton(
                    onTap: () {
                      Get.to(const MyOrders());
                    },
                    bcolor: Color(kBlue.value),
                    color: Colors.white,
                    text: "Send Order",
                    size: headersize + 2,
                    fw: FontWeight.normal,
                    width: buttonWidth,
                    height: buttonHeight)
              ],
            ),
          );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: toolbarheight,
        title: ReusableText(
            text: "Add Order",
            style: appstyle(headersize, Colors.black, FontWeight.normal)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                const AddImage(),
                Column(
                  children: [
                    const HeightSpacer(size: 20),
                    ReusableText(
                        text: "Choose timing",
                        style: appstyle(headersize + 2, Color(kDark.value),
                            FontWeight.w500)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Transform.translate(
                                offset: const Offset(-8, 0),
                                child: ReusableText(
                                    text: "immediately",
                                    style: appstyle(
                                        headersize,
                                        Color(kDark.value),
                                        FontWeight.normal))),
                            leading: Transform.scale(
                              scale: radioscale,
                              child: Radio<int>(
                                activeColor: Color(kOrange.value),
                                value: 1,
                                groupValue: _selectedValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedValue = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Transform.translate(
                                offset: const Offset(-8, 0),
                                child: ReusableText(
                                    text: "Based on time",
                                    style: appstyle(
                                        headersize,
                                        Color(kDark.value),
                                        FontWeight.normal))),
                            leading: Transform.scale(
                              scale: radioscale,
                              child: Radio<int>(
                                activeColor: Color(kOrange.value),
                                value: 2,
                                groupValue: _selectedValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    _selectedValue = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    content
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
