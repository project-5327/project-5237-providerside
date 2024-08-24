import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/desktop/onboarding/onboarding3.dart';

import '../../presentation/constants/color.dart';
import '../../presentation/constants/strings.dart';
import 'appname.dart';
import 'create_profile.dart';

class Onboarding2Screen extends StatefulWidget {
  const Onboarding2Screen({super.key});

  @override
  State<Onboarding2Screen> createState() => _Onboarding2ScreenState();
}

class _Onboarding2ScreenState extends State<Onboarding2Screen> {
  bool isFreelancer = true;
  String _selectedValue = 'Client';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const AppNameScreen(),
          Flexible(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  Center(
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
                          const Text(
                            AppStrings.register,
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const SizedBox(height: 32.0),
                          const Text(
                            AppStrings.email,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff222222),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: AppStrings.enterUrEmail,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            AppStrings.passWord1,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff222222),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: '****************',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            AppStrings.repeatPassword,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff222222),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: '****************',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40.0),
                          Center(
                            child: Text(
                              AppStrings.iAmI,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Center(
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: MyColors.black.withOpacity(0.5)),
                                ),
                                height: 30,
                                width: 252,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 28,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: _selectedValue == 'Freelancer'
                                            ? MyColors.btnColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Radio<String>(
                                            activeColor: Colors.red,
                                            value: 'Freelancer',
                                            groupValue: _selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedValue = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Freelancer',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  _selectedValue == 'Freelancer'
                                                      ? Colors.white
                                                      : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Provider Option
                                    Container(
                                      height: 28,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: _selectedValue == 'Client'
                                            ? MyColors.btnColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                            activeColor: Colors.red,
                                            value: 'Client',
                                            groupValue: _selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedValue = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Client',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: _selectedValue == 'Client'
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(height: 40.0),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(CreateYourProfileScreen());
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
                                AppStrings.register,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                AppStrings.alreadyAccount,
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppStrings.signIn,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.btnColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
