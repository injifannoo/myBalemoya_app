import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {super.key,
      required this.width,
      this.height,
      required this.icon,
      this.color});

  final double width;
  final double? height;
  final IconData icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Icon(
      color: color ?? Colors.white,
      icon,
      size: MediaQuery.of(context).size.width * width,
    );
    SizedBox(
      width: width, // Container width
      height: height, // Container height
      child: FittedBox(
        fit: BoxFit.fill,
        child: Icon(
          icon,
          color: color ?? Colors.white,
        ),
      ),
    );
  }
}
