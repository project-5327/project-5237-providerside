import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/filter/filter.dart';

import '../constants/assets.dart';
import '../constants/color.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 57.h,
          width: 277.w,
          child: TextFormField(
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
            onTap: () async {
              Get.to(const FilterScreen());
              // List<String>? selectedFilters = await Get.to(FilterScreen());
              // if (selectedFilters != null && selectedFilters.isNotEmpty) {
              //   _applyFilters(selectedFilters);
            },
            child: SvgPicture.asset(Assets.filter)),
      ],
    );
  }
}
