import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_5237_provider/config/baseclient/base_client.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/screens/login_register/login.dart';
import 'package:project_5237_provider/presentation/screens/login_register/notification.dart';
import 'package:project_5237_provider/presentation/screens/milestones/milestone.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/my_contacts.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: MyColors.black,
                ),
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      SettingWidget(
                        text: 'Notifications',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationScreen()));
                        },
                      ),
                      SettingWidget(
                          text: 'Update Password',
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Comming Soon")));
                          }),
                      SettingWidget(
                        text: 'Milestones',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MilestoneScreen()));
                        },
                      ),
                      SettingWidget(
                        text: 'My Contracts',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MycontractScreen()));
                        },
                      ),
                      SettingWidget(
                          text: 'Privacy & Policy',
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Comming Soon")));
                          }),
                      SettingWidget(
                          text: 'FAQ',
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Comming Soon")));
                          }),
                      SettingWidget(
                          text: 'Logout', onTap: () => dialogBoxCustom(context))
                    ])))));
  }

  void dialogBoxCustom(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Center(
                child: Text(
              'Are you sure?',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: MyColors.black,
              ),
            )),
            content: Text(
              'Do you really want to log out?',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: MyColors.black,
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: MyColors.btnColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                    ),
                    onPressed: () {
                      BaseClient.logout()
                          .then((value) => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (Route<dynamic> route) => false,
                              ));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("User log out succesfully")));
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: MyColors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: MyColors.btnColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      print('Request rejected');
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: MyColors.white,
                      ),
                    ),
                  ),
                ],
              )
            ]);
      },
    );
  }
}

class SettingWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const SettingWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                fontfamily: "Inter",
                text: text,
                color: MyColors.black,
                size: 14.sp,
                fontweight: FontWeight.w500,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: MyColors.grey,
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          color: MyColors.grey1,
          thickness: 0.5,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
