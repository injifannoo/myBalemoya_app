import 'package:my_balemoya_app/UI/common/exports.dart';
import 'package:my_balemoya_app/common/custom_icon.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? _selectedImage;
  File? _selectedMedia;
  void _takePicture() async {
    final imagePicker = ImagePicker();

    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage == null) {
      return;
    }
    setState(
      () {
        _selectedImage = File(pickedImage.path);
      },
    );
  }

  void _takeMedia() async {
    final imagePicker = ImagePicker();

    final XFile? pickedMedia = await imagePicker.pickMedia();
    if (pickedMedia == null) {
      return;
    }
    setState(
      () {
        _selectedMedia = File(pickedMedia.path);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double? boxWidth;
    double? boxHeight;

    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        boxWidth = 290.w;
        boxHeight = 260.h;
      } else {
        boxWidth = 145.w;
        boxHeight = 260.h;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        boxWidth = 260.w;
        boxHeight = 240.h;
      } else {
        boxWidth = 170.w;
        boxHeight = 240.h;
      }
    }
    Widget content = HeaderSubtitle(
      header: "Image or Video of the Problem",
      subtitle: Icons.camera_alt_outlined,
      subtile2: Icons.videocam,
      onTapCamera: _takePicture,
      onTapMedia: _takeMedia,
    );
    if (_selectedImage != null) {
      content = ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: GestureDetector(
          onTap: _takePicture,
          child: Image.file(
            _selectedImage!,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ),
      );
    }
    if (_selectedMedia != null) {
      content = GestureDetector(
        onTap: _takeMedia,
        child: Image.file(
          _selectedMedia!,
        ),
      );
    }

    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Color(kLightGrey.value)),
            color: Color(kLight.value)),
        height: boxHeight,
        width: boxWidth,
        alignment: Alignment.center,
        child: content);
  }
}

class HeaderSubtitle extends StatelessWidget {
  final String header;
  final IconData subtitle;
  final IconData subtile2;
  final void Function() onTapCamera;
  final void Function() onTapMedia;
  const HeaderSubtitle(
      {super.key,
      required this.header,
      required this.subtitle,
      required this.subtile2,
      required this.onTapCamera,
      required this.onTapMedia});

  @override
  Widget build(BuildContext context) {
    double? iconwidth;

    double? headersize;

    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        headersize = 16;
        iconwidth = 0.06;
      } else {
        headersize = 8;
        iconwidth = 0.03;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        headersize = 15;
        iconwidth = 0.05;
      } else {
        headersize = 10;
        iconwidth = 0.03;
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          header,
          style: appstyle(headersize + 2, Colors.grey, FontWeight.w500),
        ),
        const HeightSpacer(
            size:
                10), // Optional: add some space between the header and the subtitle
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: onTapCamera,
              child: CustomIcon(
                width: iconwidth + 0.03,
                icon: subtitle,
                color: Color(kOrange.value),
              ),
            ),
            GestureDetector(
              onTap: onTapMedia,
              child: CustomIcon(
                width: iconwidth + 0.03,
                icon: subtile2,
                color: Color(kOrange.value),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
