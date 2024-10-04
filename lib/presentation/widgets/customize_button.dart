// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';

class CustomizeButton extends StatelessWidget {
  final String text;

  final width;
  final height;
  final color;
  final radius;
  final borderColor;
  final textColor;
  final VoidCallback onTap;

  const CustomizeButton({
    super.key,
    required this.text,
    this.width,
    this.height,
    required this.onTap,
    this.color,
    this.textColor,
    this.borderColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final reponsive = ResponsiveCheck(context);
    return GestureDetector(
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
                fontSize: reponsive.isMobile ? 14.sp : 14,
                fontWeight: FontWeight.w600,
                color: textColor),
          ),
        ),
      ),
    );
  }
}
