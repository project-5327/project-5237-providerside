import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';
import 'package:provider/provider.dart';

import '../../../../../controller/country_controller.dart';
import '../../../../../controller/profile_controller.dart';
import '../../../../../provider/onboarding/onbaording_provider.dart';
import '../../../../constants/color.dart';
import '../../../../constants/strings.dart';
import '../../../../widgets/customize_button.dart';
import '../profile3.dart';
import '../profile5.dart';

class Profilewidget4 extends StatefulWidget {
  const Profilewidget4({super.key});

  @override
  State<Profilewidget4> createState() => _Profilewidget4State();
}

class _Profilewidget4State extends State<Profilewidget4> {
  final ProfileController profileController = Get.put(ProfileController());

  final FormController formController = Get.put(FormController());

  final DropdownController dropdownController = Get.put(DropdownController());

  final TextEditingController controller = TextEditingController();

  final TextEditingController _languageController = TextEditingController();
  final List<String> _languages = ['English', 'Hindi', 'Spanish', 'German'];
  List<String> _selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<OnbaordingProvider>(
        builder: (context, onboardingProvider, child) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h),
                TextWidget(
                  align: TextAlign.start,
                  text: AppStrings.addLanguages,
                  color: MyColors.black,
                  size: 20.sp,
                  fontweight: FontWeight.w600,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextWidget(
                  align: TextAlign.start,
                  text: AppStrings.createProfileLorem1,
                  color: MyColors.grey,
                  size: 10.sp,
                  fontweight: FontWeight.w500,
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextWidget(
                  align: TextAlign.start,
                  text: "Languages you know",
                  color: Color(0xff222222),
                  size: 13.sp,
                  fontweight: FontWeight.w600,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  height: 100,
                  child: DropDownMultiSelect(
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      focusColor: Theme.of(context).colorScheme.onPrimary,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: MyColors.lightGrey, width: 1.5)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                            color: MyColors.blue,
                            width: 1.5,
                          )),
                    ),
                    options: _languages,
                    selectedValues: _selectedLanguages,
                    onChanged: (List<String> value) {},
                    whenEmpty: 'Select languages',
                  ),
                ),
                SizedBox(height: 160.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: AppStrings.privious,
                      height: 40.h,
                      width: 150.w,
                      color: MyColors.white,
                      textColor: MyColors.btnColor,
                      onTap: () {
                        // if (formKey.currentState!.validate()) {
                        profileController.previousPage();
                        Get.to(() => Profile3());
                        // }
                      },
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: AppStrings.next,
                      height: 40.h,
                      width: 150.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () {
                        debugPrint(
                            "Selected languages: ${_selectedLanguages.length}");
                        // if (formKey.currentState!.validate()) {
                        onboardingProvider.setLanguages = _selectedLanguages;
                        onboardingProvider.addYourLangauges(
                            onboardingProvider.languages,
                            onboardingProvider.proficiancyController.text);

                        profileController.nextPage();
                        Get.to(() => Profile5());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 42.h),
              ],
            ),
          ),
        ],
      );
    });
  }
}

/*

Container(
width: MediaQuery.of(context).size.width / 1,
height: 100,
padding: const EdgeInsets.all(20),
child: DropDownMultiSelect(
decoration: InputDecoration(
fillColor: Theme.of(context).colorScheme.onPrimary,
focusColor: Theme.of(context).colorScheme.onPrimary,
enabledBorder: const OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(4)),
borderSide: BorderSide(color: Colors.grey, width: 1.5)),
focusedBorder: const OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(4)),
borderSide: BorderSide(
color: Colors.blue,
width: 1.5,
)),
),
options: variantsList,
selectedValues: selectedCheckBoxValue,
onChanged: (List<String> value) {
//   value = selectedCheckBoxValue;
print("${selectedCheckBoxValue}");
},
whenEmpty: 'Select Location',
),
),*/


