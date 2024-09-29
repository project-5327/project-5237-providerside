import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/container_controller.dart';
import 'package:project_5237_provider/controller/country_controller.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/create_your_profile.dart';
import 'package:project_5237_provider/presentation/screens/filter/filter.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';
import 'package:project_5237_provider/presentation/widgets/create_profile_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth/register_provider.dart';
import '../../constants/color.dart';
import '../../widgets/customize_button.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({super.key});
  //final _accountKey = GlobalKey<FormState>();
  final FormController formcontroller = Get.put(FormController());
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  //final TextEditingController countryController = TextEditingController();
  final ContainerController containerController =
      Get.put(ContainerController());
  final DropdownController dropdownController = Get.put(DropdownController());
  final List<String> countries = ['USA', 'India', 'Canada', 'Japan'];
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
        builder: (context, registerProvider, child) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CreateProfileWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    // key: _accountKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomTextFormField(
                          controller: registerProvider.fnameController,
                          validator: (value) =>
                              formcontroller.validateFirstName(value ?? ''),
                          title: 'First Name',
                          text: 'Enter your name',
                        ),
                        SizedBox(
                          height: 27.h,
                        ),
                        CustomTextFormField(
                          controller: registerProvider.lnameController,
                          validator: (value) =>
                              formcontroller.validateLastName(value ?? ''),
                          title: 'Last Name',
                          text: 'Enter your name',
                        ),
                        SizedBox(
                          height: 27.h,
                        ),

                        // Obx(

                        SizedBox(
                          height: 47.h,
                        ),
                        Center(
                          child: TextWidget(
                            align: TextAlign.center,
                            text: 'Complete your free account \nsetup',
                            color: MyColors.black,
                            size: 16.sp,
                            fontweight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Center(
                          child: Row(
                            children: [
                              Obx(
                                () => InkWell(
                                  onTap: () =>
                                      containerController.toggelSelection(0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 18.h,
                                    width: 18.w,
                                    child: containerController.selectedcont[0]
                                        ? Icon(
                                            size: 12.sp,
                                            Icons.check,
                                            color: MyColors.white,
                                          )
                                        : null,
                                    decoration: BoxDecoration(
                                        color:
                                            containerController.selectedcont[0]
                                                ? Color(0xffFF4C4A)
                                                : MyColors.white,
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        border: Border.all(
                                            width: 2.w,
                                            color: MyColors.black
                                                .withOpacity(0.3))),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              TextWidget(
                                text:
                                    'Yes! Send me genuinely useful emails every now \nand \nthen to help me get the most out of Upwork.',
                                color: MyColors.black.withOpacity(0.5),
                                size: 10.sp,
                                fontweight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Obx(
                              () => InkWell(
                                onTap: () =>
                                    containerController.toggelSelection(1),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 18.h,
                                  width: 18.w,
                                  child: containerController.selectedcont[1]
                                      ? Icon(
                                          size: 12.sp,
                                          Icons.check,
                                          color: MyColors.white,
                                        )
                                      : null,
                                  decoration: BoxDecoration(
                                      color: containerController.selectedcont[1]
                                          ? Color(0xffFF4C4A)
                                          : MyColors.white,
                                      borderRadius: BorderRadius.circular(4.r),
                                      border: Border.all(
                                          width: 2.w,
                                          color:
                                              MyColors.black.withOpacity(0.3))),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                text: 'Yes, I understand and agree to the ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: MyColors.black.withOpacity(0.5),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'UPTECHUNT \nTerms',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffFF4C4A),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: 'of Service, ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Color(0xffFF4C4A),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'including the ',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.black.withOpacity(0.5),
                                  ),
                                ),
                                TextSpan(
                                    text:
                                        'User Agreement and \n Privacy Policy. ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: Color(0xffFF4C4A))),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Center(
                          child: CustomizeButton(
                            borderColor: MyColors.btnColor,
                            radius: 100.r,
                            text: 'Create your Account',
                            height: 40.h,
                            width: 334.w,
                            color: MyColors.btnColor,
                            textColor: MyColors.white,
                            onTap: () {
                              debugPrint(
                                  "name=====>${registerProvider.fnameController}");
                              debugPrint(
                                  "name=====>${registerProvider.lnameController}");
                              debugPrint(
                                  "Email=====>${registerProvider.emailController}");
                              debugPrint(
                                  "password=====>${registerProvider.passwordController}");
                              debugPrint(
                                  "isClient=====>${registerProvider.isClient}");
                              registerProvider.signUpBtn(context: context);
                              // if (_accountKey.currentState!.validate()) {
                              Get.to(() => CreateYourProfile());
                              // }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 42.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}



       // context: context,
        // builder: (BuildContext context) {
        //   return
   
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//           child: Container(
//             padding: EdgeInsets.all(16.w),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Choose Your Country',
//                   style: TextStyle(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 16.h),
//                 ...countries.map((country) {
//                   return ListTile(
//                     title: Text(
//                       country,
//                       style: TextStyle(fontSize: 16.sp),
//                     ),
//                     onTap: () {
//                       countryController.selectedCountry.value = country;
//                       Get.back(); // Close the dialog
//                     },
//                   );
//                 }).toList(),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
