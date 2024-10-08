import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/provider/filter_provider.dart';

import '../../constants/color.dart';
import '../../widgets/customize_button.dart';
import '../my_contracts/send_screen.dart';

import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final Map<String, List<int>> _selectedChecks = {};
  final Map<String, bool> _isExpanded = {
    'Sort': false,
    'Tags': false,
    'Rate': false,
    'Category': false,
    'Subcategory': false,
    'Skills': false,
    'Timeline': false,
    'Budget': false,
  };

  late Map<String, List<String>> _filterOptions;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final filterProvider =
          Provider.of<FilterProvider>(context, listen: false);
      filterProvider.fetchAllFilters(context).then((_) {
        setState(() {
          _filterOptions = filterProvider.getFilterOptions();
          for (var key in _filterOptions.keys) {
            _selectedChecks[key] = [];
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, filterProvider, child) {
        return SafeArea(
            child: Scaffold(
          body: filterProvider.loading
              ? Center(
                  child: CircularProgressIndicator(color: MyColors.blue),
                )
              : SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      height: 36.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: MyColors.btnColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: 'Filter',
                              color: MyColors.white,
                              size: 18.sp,
                              fontweight: FontWeight.w600,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: MyColors.white,
                                size: 14.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ..._filterOptions.keys.map((key) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        child: FilterContainer(
                          text: key,
                          isExpanded: _isExpanded[key]!,
                          onTap: () {
                            setState(() {
                              _isExpanded[key] = !_isExpanded[key]!;
                            });
                          },
                          child: _isExpanded[key]!
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: _filterOptions[key]!.length,
                                  itemBuilder: (context, index) {
                                    return Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: _selectedChecks[key]!
                                                .contains(index),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                if (value == true) {
                                                  _selectedChecks[key]!
                                                      .add(index);
                                                } else {
                                                  _selectedChecks[key]!
                                                      .remove(index);
                                                }
                                              });
                                            },
                                          ),
                                          RichTextWidget(
                                            text: _filterOptions[key]![index],
                                            text1: '( ${index + 1} )',
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              : Container(),
                        ),
                      );
                    }),
                    SizedBox(height: 430.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: CustomizeButton(
                              borderColor: MyColors.btnColor,
                              radius: 0.r,
                              text: 'Apply Filter',
                              height: 35.h,
                              width: 143.w,
                              color: MyColors.btnColor,
                              textColor: MyColors.white,
                              onTap: () {
                                List<String> selectedFilters = [];
                                for (var key in _filterOptions.keys) {
                                  for (var index in _selectedChecks[key]!) {
                                    selectedFilters
                                        .add(_filterOptions[key]![index]);
                                  }
                                }

                                Navigator.pop(context, selectedFilters);

                                debugPrint(
                                    'Selected Filters======> $selectedFilters');
                              },
                            ),
                          ),
                          Center(
                            child: CustomizeButton(
                              borderColor: MyColors.btnColor,
                              radius: 0.r,
                              text: 'Reset Filter',
                              height: 35.h,
                              width: 143.w,
                              color: MyColors.btnColor,
                              textColor: MyColors.white,
                              onTap: () {
                                // _selectedChecks.clear();
                                // Navigator.pop(context);
                                // setState(() {
                                //   _selectedChecks.clear();

                                //   _isExpanded.updateAll((key, value) => false);
                                // });
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    )
                  ]),
                ),
        ));
      },
    );
  }
}

class FilterContainer extends StatelessWidget {
  final String text;
  final bool isExpanded;
  final Widget child;
  final VoidCallback onTap;

  const FilterContainer(
      {super.key,
      required this.text,
      required this.isExpanded,
      required this.onTap,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 36.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: MyColors.btnColor.withOpacity(0.41),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: text,
                    color: MyColors.white,
                    size: 12.sp,
                    fontweight: FontWeight.w600,
                  ),
                  Icon(
                    isExpanded ? Icons.remove : Icons.add,
                    color: MyColors.white,
                    size: 13.sp,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded) child,
        ],
      ),
    );
  }
}

class RichTextWidget extends StatelessWidget {
  final String text;
  final String text1;
  const RichTextWidget({super.key, required this.text, required this.text1});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
          color: MyColors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text1,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
