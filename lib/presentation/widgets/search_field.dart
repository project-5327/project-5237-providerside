import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/filter/filter.dart';

import '../constants/assets.dart';
import '../constants/color.dart';

class SearchField extends StatelessWidget {
  final controller;
  final onChanged;
  final VoidCallback onTap;
  const SearchField(
      {super.key, this.controller, this.onChanged, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 57.h,
          width: 277.w,
          child: TextFormField(
            onChanged: onChanged,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: const Icon(CupertinoIcons.search),
              hintText: 'Search for projects',
              hintStyle: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.lightGrey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          // onTap:
          child: SvgPicture.asset(Assets.filter),
        ),
      ],
    );
  }
}
