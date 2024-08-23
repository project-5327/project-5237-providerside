import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../constants/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? text;
  final double? width;
  final double? height;
  final IconButton? icon;
  final TextStyle? style;
  final int? maxLines;
  final bool? readOnly;

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
      this.height,
      this.maxLines,
      this.readOnly});

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
            readOnly: readOnly ?? false,
            maxLines: maxLines ?? 1,
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
                  fontSize: 12.sp,
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
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 1, color: const Color(0xff464646)),
        ),
        height: height,
        width: width,
        child: Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
            child: DropdownButton<String>(
              alignment: Alignment.bottomCenter,
              style: TextStyle(
                fontSize: 10.sp,
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
                  fontSize: 9.sp,
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
