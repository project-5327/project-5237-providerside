import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/color.dart';
import '../../widgets/customize_button.dart';
import '../login_register/message.dart';
import '../my_contracts/send_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  //bool _isChecked = false;

  int? _selectedCheck;
  Map<String, bool> _isExpanded = {
    'Sort': false,
    'Tags': false,
    'Rate': false,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                      Icon(
                        Icons.close,
                        color: MyColors.white,
                        size: 14.sp,
                      )
                    ],
                  ),
                ),
              ),
              FilterContainer(
                text: 'Sort',
                isExpanded: _isExpanded['Sort']!,
                onTap: () {
                  setState(() {
                    _isExpanded['Sort'] = !_isExpanded['Sort']!;
                  });
                },
                child: _isExpanded['Sort']!
                    ? Column(
                        children: [
                          // Add Rate Options Here
                          Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: _selectedCheck == 0,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _selectedCheck =
                                              value == true ? 0 : null;
                                        });
                                      }),
                                  RichTextWidget(
                                      text: 'R\$ 10 - R\$ 200 ',
                                      text1: '( 2 )'),
                                ],
                              )),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: _selectedCheck == 1,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _selectedCheck =
                                              value == true ? 1 : null;
                                        });
                                      }),
                                  RichTextWidget(
                                      text: 'R\$ 300 - R\$ 700 ',
                                      text1: '( 1 )'),
                                ],
                              )),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: _selectedCheck == 2,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _selectedCheck =
                                              value == true ? 2 : null;
                                        });
                                      }),
                                  RichTextWidget(
                                      text: 'R\$ 1000 + ', text1: '( 1 )'),
                                ],
                              )),
                        ],
                      )
                    : Container(),
              ),
              SizedBox(
                height: 2.h,
              ),
              FilterContainer(
                text: 'Rate',
                isExpanded: _isExpanded['Rate']!,
                onTap: () {
                  setState(() {
                    _isExpanded['Rate'] = !_isExpanded['Rate']!;
                  });
                },
                child: _isExpanded['Rate']!
                    ? Column(
                        children: [
                          // Add Rate Options Here
                          Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: _selectedCheck == 0,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _selectedCheck =
                                              value == true ? 0 : null;
                                        });
                                      }),
                                  RichTextWidget(
                                      text: 'R\$ 10 - R\$ 200 ',
                                      text1: '( 2 )'),
                                ],
                              )),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: _selectedCheck == 1,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _selectedCheck =
                                              value == true ? 1 : null;
                                        });
                                      }),
                                  RichTextWidget(
                                      text: 'R\$ 300 - R\$ 700 ',
                                      text1: '( 1 )'),
                                ],
                              )),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: _selectedCheck == 2,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _selectedCheck =
                                              value == true ? 2 : null;
                                        });
                                      }),
                                  RichTextWidget(
                                      text: 'R\$ 1000 + ', text1: '( 1 )'),
                                ],
                              )),
                        ],
                      )
                    : Container(),
              ),
              SizedBox(
                height: 430.h,
              ),
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
                        Get.to(MessageScreen());
                      },
                    )),
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
                        Get.to(MessageScreen());
                      },
                    )),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilterContainer extends StatelessWidget {
  final String text;
  final bool isExpanded;
  final Widget child;
  final VoidCallback onTap;

  FilterContainer(
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
