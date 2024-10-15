// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_5237_provider/presentation/constants/fonts.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';

import '../constants/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? text;
  final IconButton? icon;
  final TextStyle? style;
  final errorMessage;
  final int? size;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Color? color;
  final bool obscureText;
  final Color? fillcolor;
  final double? width;
  final double? height;
  final keyboardType;
  final int? maxlines;
  final bool? readOnly;
  final FocusNode? focusNode;

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
      this.keyboardType,
      this.readOnly,
      this.size,
      this.color,
      this.maxlines,
      this.fillcolor,
      this.width,
      this.height,
      this.focusNode,
      this.errorMessage});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: style ??
              TextStyle(
                fontSize: 13.sp,
                color: MyColors.black,
                fontWeight: FontWeight.w600,
                fontFamily: Fonts.fontsinter,
              ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            focusNode: focusNode,
            maxLines: obscureText ? 1 : null, // Restrict to 1 line if obscured
            readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              errorMaxLines: errorMessage ?? 1,
              fillColor: fillcolor,
              suffixIcon: icon,
              hintText: text,
              hintStyle: TextStyle(
                  fontSize: 13,
                  color: color ?? MyColors.lightGrey,
                  fontFamily: 'Lexend'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomDropdownContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final String hint;
  final List<String>? items;
  final ValueChanged<String?>? onChanged;
  final String selectedValue;

  const CustomDropdownContainer({
    super.key,
    this.width,
    this.height,
    required this.hint,
    this.items,
    this.onChanged,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 1, color: const Color(0xff464646)),
        ),
        height: height,
        width: width,
        child: Padding(
            padding: responsive.isMobile
                ? const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0)
                : const EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
            child: DropdownButton<String>(
              alignment: Alignment.bottomCenter,
              style: TextStyle(
                fontSize: responsive.isMobile ? 10.sp : 13.sp,
                color: MyColors.black1,
                fontWeight: FontWeight.w400,
              ),
              borderRadius: BorderRadius.circular(6.r),
              isDense: true,
              value:
                  items?.contains(selectedValue) == true ? selectedValue : null,
              hint: Text(
                selectedValue.isEmpty ? hint : selectedValue,
                style: TextStyle(
                  fontSize: responsive.isMobile ? 10.sp : 13.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.lightGrey,
                ),
              ),
              isExpanded: true,
              icon: Icon(
                Icons.arrow_drop_down,
                color: MyColors.grey,
                size: 30.sp,
              ),
              items: items?.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChanged,
            )));
  }
}
