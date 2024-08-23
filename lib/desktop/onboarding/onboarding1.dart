import 'package:flutter/material.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';

import 'appname.dart';

class OnbarodingScreen1 extends StatefulWidget {
  const OnbarodingScreen1({super.key});

  @override
  State<OnbarodingScreen1> createState() => _OnbarodingScreen1State();
}

class _OnbarodingScreen1State extends State<OnbarodingScreen1> {
  bool isRememberMeChecked = false;

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
                      boxShadow:const  [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    width: 400.0, // Width of the form container
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AppStrings.signIn,
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          AppStrings.happy,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 32.0),
                       const Text(
                          AppStrings.email,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff999999),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: AppStrings.enterUrEmail,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16.0),
                       const Text(
                          AppStrings.passWord,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff999999),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          decoration:const InputDecoration(
                            hintText: AppStrings.enterUrPassWord,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isRememberMeChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isRememberMeChecked = value!;
                                    });
                                  },
                                ),
                                Text(AppStrings.remaindMe),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                AppStrings.forgetPassword,
                                style: TextStyle(
                                  color: MyColors.btnColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32.0),
                         SizedBox(
                          width: double.infinity,
                        child:  ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.blue,
                              padding: EdgeInsets.all(10),
                              textStyle: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0), // Small circle at the corners
                              ),
                            ),
                            child:const  Text(
                              AppStrings.signIn,
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
                            AppStrings.dontHaveAccount,
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                AppStrings.register,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
