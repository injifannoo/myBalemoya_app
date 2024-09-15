import 'package:flutter/material.dart';
import 'package:my_balemoya_app/common/exports.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboard,
    this.suffixIcon,
    this.obscureText,
    this.onEditingComplete,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final void Function()? onEditingComplete;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    double? headersize;
    double? iconwidth;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        headersize = 22;
      } else {
        headersize = 6;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        headersize = 14;
      } else {
        headersize = 12;
      }
    }
    return TextField(
        keyboardType: keyboard,
        obscureText: obscureText ?? false,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          suffixIconColor: Color(kBlue.value),
          hintStyle: appstyle(headersize - 1,
              Color((kBlue.value)).withOpacity(0.6), FontWeight.w500),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(kBlue.value),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        controller: controller,
        cursorHeight: 25,
        style: appstyle(headersize + 1, Color(kBlue.value), FontWeight.w500),
        onSubmitted: validator);
  }
}
