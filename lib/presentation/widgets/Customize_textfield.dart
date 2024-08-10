import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? text;
  final double? width;
  final double? height;
  final Icon? icon;
  final TextStyle? style;
  final Color? fillcolor;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {super.key,
      this.title,
      this.style,
      this.obscureText = false,
      this.controller,
      this.onChanged,
      this.validator,
      this.text,
      this.icon,
      this.fillcolor,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(title ?? "",
              style: TextStyle(
                  color: MyColors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: 5.h),
        Container(
          height: height,
          width: width,
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              focusColor: MyColors.black,
              fillColor: fillcolor,
              suffixIcon: icon,
              hintText: text,
              hintStyle: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.lightGrey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              border: OutlineInputBorder(
                // borderSide: BorderSide(color: MyColors.black),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
