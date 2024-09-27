import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/screens/login_register/EditProfile.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';
import 'package:project_5237_provider/presentation/widgets/customize_textfield.dart';

import '../../../controller/date_time_controller.dart';
import '../../constants/assets.dart';
import '../../constants/color.dart';

class DebitCredit extends StatelessWidget {
  DebitCredit({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController cardnoController = TextEditingController();
  final TextEditingController cvController = TextEditingController();
  final FormController formController = Get.put(FormController());
  final DateTimeController dateTimeController = Get.put(DateTimeController());

  final TextEditingController expiryController = TextEditingController();

  List<String> images = [
    'assets/icons/debit card.jpg',
    'assets/icons/debit card.jpg',
    'assets/icons/debit card.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Credit/ Debit Card',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder:
                        (BuildContext context, int index, int itemIndex) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        width: 350.w,
                        height: 183.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(images[index]),
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    validator: (value) =>
                        formController.validateUserName(value ?? ''),
                    title: 'Full Name',
                    controller: userController,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    validator: (value) =>
                        formController.validateCard(value ?? ''),
                    title: 'Card number',
                    controller: cardnoController,
                    text: '**** **** ****',
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          validator: (value) =>
                              formController.validateDate(value ?? ''),
                          title: 'Expiry Date',
                          controller: expiryController,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomTextFormField(
                          validator: (value) =>
                              formController.validateCVC(value ?? ''),
                          icon: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.creditIC),
                          ),
                          title: 'CVC',
                          controller: cvController,
                          text: '****',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Center(
                    child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: 'Done',
                      height: 40.h,
                      width: 334.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//   onTap: () {
                //     dateTimeController.pickDate(context);
                //   },
                //   controller: TextEditingController(
                //     text: dateTimeController.selectedDate.value
                //         .toString()
                //         .substring(0, 10), // Format the date as needed
                //   ),
                // )),