import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';

import '../../../../controller/country_controller.dart';
import '../../../../controller/form_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../constants/color.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import 'profile5.dart';
import 'static_profile.dart';

class Profile4 extends StatelessWidget {
  Profile4({super.key});

  final ProfileController profileController = Get.put(ProfileController());
  final formKey = GlobalKey<FormState>();
  final FormController formController = Get.put(FormController());
  final DropdownController dropdownController = Get.put(DropdownController());

  final TextEditingController controller = TextEditingController();
  final List<String> level = ['Beginner', 'Intermediate', 'Experienced'];
  final List<String> language = ['Conversational', 'Fluent'];

  @override
  Widget build(BuildContext context) {
    return StaticProfileLayout(
      middleContentBuilder: () => Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  EditCreateProfile(
                    ontap: () {
                      _showExperienceOptions(context);
                    },
                    validator: (value) =>
                        formController.validateExperience(value),
                    controller: controller,
                    text: 'Add languages.',
                    text1:
                        "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod.",
                    feildText: '+Add Language',
                  ),
                  SizedBox(height: 20.h),
                  LanguageContainer(
                    text: 'English',
                    text1: 'My level is',
                    //  countryController: countryController,
                    level: level,
                  ),
                  SizedBox(height: 16.h),
                  LanguageContainer(
                    text: 'Spanish',
                    text1: 'My level is',
                    // countryController: countryController,
                    level: language,
                  ),
                  SizedBox(height: 78.h),
                  Center(
                    child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: 'Next',
                      height: 40.h,
                      width: 334.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          profileController.nextPage();
                          Get.to(() => Profile5());
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 42.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showExperienceOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Wrap(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: TextWidget(
                  text: 'Select Language',
                  color: MyColors.black,
                  size: 15.sp,
                  fontweight: FontWeight.w400,
                ),
              ),
              ListTile(
                title: TextWidget(
                  text: "English",
                  color: MyColors.black,
                  size: 14.sp,
                  fontweight: FontWeight.w400,
                ),
                onTap: () {
                  controller.text = "English";
                  Get.back();
                },
              ),
              ListTile(
                title: TextWidget(
                  text: "Hindi",
                  color: MyColors.black,
                  size: 14.sp,
                  fontweight: FontWeight.w400,
                ),
                onTap: () {
                  controller.text = "Hindi";
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

final DropdownController dropdownController = Get.put(DropdownController());

class LanguageContainer extends StatelessWidget {
  final String text;
  final String text1;
//  final Controller countryController;
  final List<String> level;

  const LanguageContainer({
    super.key,
    required this.text,
    required this.text1,
    //  required this.countryController,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: text,
          size: 9.sp,
          fontweight: FontWeight.w600,
          color: Color(0xff040200),
        ),
        SizedBox(width: 10.w),
        CustomDropdownContainer(
          height: 40.h,
          width: 165.w,
          hint: 'My level is',
          selectedValue: dropdownController.getValue('level'),
          onChanged: (String? newValue) {
            if (newValue != null) {
              dropdownController.updateValue('level', newValue);
            }
          },
          items: level.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(width: 14.w),
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.trash,
              color: MyColors.grey,
              size: 14.sp,
            )),
      ],
    );
  }
}
