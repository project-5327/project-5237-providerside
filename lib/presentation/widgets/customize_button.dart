import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizeButton extends StatelessWidget {
  final String text;
  final width;
  final height;
  final color;
  final radius;
  final borderColor;
  final textColor;
  final VoidCallback onTap;
  CustomizeButton(
      {super.key,
      required this.text,
      this.width,
      this.height,
      required this.onTap,
      this.color,
      this.textColor,
      this.borderColor,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 14.sp, fontWeight: FontWeight.w600, color: textColor),
          ),
        ),
      ),
    );
  }
}
