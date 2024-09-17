import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../controller/container_controller.dart';
import '../../controller/country_controller.dart';
import '../../controller/form_controller.dart';
import '../../presentation/constants/assets.dart';
import '../../presentation/constants/color.dart';
import '../../presentation/constants/strings.dart';
import '../../presentation/screens/my_contracts/send_screen.dart';
import '../../presentation/widgets/Customize_textfield.dart';
import '../../provider/auth/register_provider.dart';
import 'appname.dart';
import 'create_profile.dart';

class OnBoardingScreen3 extends StatefulWidget {
  const OnBoardingScreen3({super.key});

  @override
  State<OnBoardingScreen3> createState() => _OnBoardingScreen3State();
}

class _OnBoardingScreen3State extends State<OnBoardingScreen3> {
  final formKey = GlobalKey<FormState>();
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
        return Scaffold(
          body: Row(
            children: [
              AppNameScreen(),
              Flexible(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.white,
                    ),
                    Center(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(32.0),
                          decoration: BoxDecoration(
                            color: MyColors.blueContainer,
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10.0,
                                offset: Offset(0, 4),
                              )
                            ],
                          ),
                          width: 400.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: const Text(
                                  AppStrings.accountSetup,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.jd,
                                      width: 16,
                                    ),
                                    const Text(
                                      'jdae456@gmail.com',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              const SizedBox(height: 40.0),
                              CustomTextFormField(
                                controller: registerProvider.fnameController,
                                validator: (value) =>
                                    formcontroller.validateFirstName(value ?? ''),
                                title: 'First Name',
                                text: 'Enter your name',
                              ),
                              const SizedBox(height: 8.0),
                              const SizedBox(height: 8.0),
                              CustomTextFormField(
                                controller: registerProvider.lnameController,
                                validator: (value) =>
                                    formcontroller.validateLastName(value ?? ''),
                                title: 'Last Name',
                                text: 'Enter your name',
                              ),
                              const SizedBox(height: 40.0),

                              Center(
                                child: Row(
                                  children: [
                                    Obx(
                                          () => InkWell(
                                        onTap: () =>
                                            containerController.toggelSelection(0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 18,
                                          width: 18,
                                          child: containerController.selectedcont[0]
                                              ? Icon(
                                            size: 12,
                                            Icons.check,
                                            color: MyColors.white,
                                          )
                                              : null,
                                          decoration: BoxDecoration(
                                              color: containerController.selectedcont[0]
                                                  ? Color(0xffFF4C4A)
                                                  : MyColors.white,
                                              borderRadius: BorderRadius.circular(4),
                                              border: Border.all(
                                                  width: 2,
                                                  color:
                                                  MyColors.black.withOpacity(0.3))),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    TextWidget(
                                      text:
                                      'Yes! Send me genuinely useful emails every now \nand \nthen to help me get the most out of Upwork.',
                                      color: MyColors.black.withOpacity(0.5),
                                      size: 12,
                                      fontweight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Obx(
                                        () => InkWell(
                                      onTap: () =>
                                          containerController.toggelSelection(1),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 18,
                                        width: 18,
                                        child: containerController.selectedcont[1]
                                            ? Icon(
                                          size: 12,
                                          Icons.check,
                                          color: MyColors.white,
                                        )
                                            : null,
                                        decoration: BoxDecoration(
                                            color: containerController.selectedcont[1]
                                                ? Color(0xffFF4C4A)
                                                : MyColors.white,
                                            borderRadius: BorderRadius.circular(4),
                                            border: Border.all(
                                                width: 2,
                                                color:
                                                MyColors.black.withOpacity(0.3))),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      text: 'Yes, I understand and agree to the ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: MyColors.black.withOpacity(0.5),
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'UPTECHUNT \nTerms',
                                          style: TextStyle(
                                            fontSize: 12,
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
                                      fontSize: 12,
                                      color: Color(0xffFF4C4A),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'including the ',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.black.withOpacity(0.5),
                                        ),
                                      ),
                                      TextSpan(
                                          text:
                                          'User Agreement and \n Privacy Policy. ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Color(0xffFF4C4A))),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40.0),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    debugPrint("name=====>${registerProvider.fnameController}");
                                    debugPrint("name=====>${registerProvider.lnameController}");
                                    debugPrint("Email=====>${registerProvider.emailController}");
                                    debugPrint("password=====>${registerProvider.passwordController}");
                                    debugPrint("isClient=====>${registerProvider.isClient}");
                                    registerProvider.signUpBtn(
                                        context: context);
                                   /* Get.to(CreateYourProfileScreen());*/
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: MyColors.blue,
                                    padding: EdgeInsets.all(10),
                                    textStyle: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Small circle at the corners
                                    ),
                                  ),
                                  child: const Text(
                                    'Create your Account',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
