import 'dart:io';

import 'package:my_balemoya_app/UI/card/add_card.dart';

import 'package:my_balemoya_app/common/custom_btn.dart';
import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _bioController = TextEditingController();

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }

  void _submitBio() {
    // Handle the submission logic here
    print('Submitted Bio: ${_bioController.text}');
  }

  File? _selectedImage;
  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 50);
    if (pickedImage == null) {
      return;
    }
    _selectedImage = File(pickedImage.path);
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final bool _isExpanded = false;
  Icon man = const Icon(
    Icons.person,
    size: 36,
  );
  Icon location = Icon(
    Icons.location_on_outlined,
    size: 34,
    color: Color(kDarkGrey.value),
  );
  @override
  Widget build(BuildContext context) {
    Widget content = CircleAvatar(
      radius: 44,
      backgroundColor: Color(kBlue.value),
    );

    if (_selectedImage != null) {
      setState(() {
        content = Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
        );
      });
    }

    double? headersize;
    double? iconwidth;
    double? btnwidth;
    double? btnheight;
    double? biowidth;
    double? bioheight;
    double? toolbarheight;
    double? avatarsize;
    double? topheight;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        topheight = 80.h;
        avatarsize = 42.r;
        headersize = 18;
        iconwidth = 0.06;
        btnheight = 38;
        btnwidth = 89;
        biowidth = 350.w;
        bioheight = 150.h;
        toolbarheight = 55.h;
      } else {
        avatarsize = 80.r;
        headersize = 12;
        iconwidth = 0.05;
        btnheight = 107.h;
        btnwidth = 75;
        bioheight = 300;
        biowidth = 500;
        toolbarheight = 130.h;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        topheight = 80.h;
        avatarsize = 50.r;
        headersize = 17;
        iconwidth = 0.06;
        btnheight = 34.h;
        btnwidth = 85;
        biowidth = 350.w;
        bioheight = 150.h;
        toolbarheight = 58.h;
      } else {
        avatarsize = 80.r;
        headersize = 14;
        iconwidth = 0.04;
        btnheight = 40.h;
        btnwidth = 85;
        biowidth = 350.w;
        bioheight = 150.h;
        toolbarheight = 68.h;
      }
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: toolbarheight,
          actions: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: CustomButton(
                  text: "Save",
                  height: btnheight,
                  width: btnwidth,
                  bcolor: Color(kOrange.value),
                  color: Color(kLight.value),
                  size: headersize - 2,
                  fw: FontWeight.normal,
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
            ),
          ]),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: avatarsize,
                          backgroundColor: Color(kBlue.value),
                        ),
                        const WidthSpacer(size: 10),
                        GestureDetector(
                          onTap: _takePicture,
                          child: Icon(
                            Icons.camera_alt,
                            size: MediaQuery.of(context).size.width * iconwidth,
                          ),
                        )
                      ],
                    ),
                    const WidthSpacer(size: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: btnheight,
                              width: sWidth * 0.4,
                              child: TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  labelText: 'First Name',
                                  labelStyle: appstyle(
                                      headersize - 2,
                                      Color(kDarkGrey.value),
                                      FontWeight.normal),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(kDarkGrey.value),
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: btnheight,
                          width: sWidth * 0.4,
                          child: TextFormField(
                            style: appstyle(headersize - 2, Colors.black,
                                FontWeight.normal),
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              labelStyle: appstyle(headersize - 2,
                                  Color(kDarkGrey.value), FontWeight.normal),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(kDarkGrey.value),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const HeightSpacer(size: 15),
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: sWidth * 0.7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            style: appstyle(headersize - 2, Colors.black,
                                FontWeight.normal),
                            controller: _bioController,
                            decoration: InputDecoration(
                              labelText: 'Enter your bio',
                              labelStyle: appstyle(headersize - 1,
                                  Colors.black38, FontWeight.normal),
                              border: const OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white60,
                            ),
                            maxLines: null,
                            maxLength: 150, // Allows for multi-line input
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              ReusableText(
                  text: "Information",
                  style: appstyle(
                      headersize, Color(kDark.value), FontWeight.w400)),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(kDarkGrey.value)),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "Language",
                        style: appstyle(headersize - 2, Color(kDark.value),
                            FontWeight.w400),
                      ),
                      ReusableText(
                        text: "xxxxx",
                        style: appstyle(headersize - 4, Color(kDarkGrey.value),
                            FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const HeightSpacer(size: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(kDarkGrey.value)),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "Language",
                        style: appstyle(headersize - 2, Color(kDark.value),
                            FontWeight.w400),
                      ),
                      ReusableText(
                        text: "xxxxx",
                        style: appstyle(headersize - 4, Color(kDarkGrey.value),
                            FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const HeightSpacer(size: 10),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(kDarkGrey.value)),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "Language",
                        style: appstyle(headersize - 2, Color(kDark.value),
                            FontWeight.w400),
                      ),
                      ReusableText(
                        text: "xxxxx",
                        style: appstyle(headersize - 4, Color(kDarkGrey.value),
                            FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightSpacer(size: 10),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ReusableText(
                    text: "Payment",
                    style: appstyle(
                        headersize, Color(kDark.value), FontWeight.w400)),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(kDarkGrey.value)),
                  ),
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(const AddCard());
                          },
                          icon: Icon(
                            Icons.add_circle,
                            size: MediaQuery.of(context).size.width * iconwidth,
                            color: Color(kOrange.value),
                          ),
                        ),
                        const WidthSpacer(size: 10),
                        Column(
                          children: [
                            ReusableText(
                              text: "Add a Card",
                              style: appstyle(headersize - 2,
                                  Color(kDark.value), FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
