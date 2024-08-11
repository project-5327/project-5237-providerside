import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../../constants/color.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';
import '../message/forget_password.dart';
import 'Add_projects.dart';

class Editprofile extends StatefulWidget {
  Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyColors.black,
            ),
          ),
          title: Text(
            'Edit Your Profile',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                indicator: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: BorderSide(
                      color: MyColors.btnColor,
                      width: 2.w,
                    ),
                  ),
                ),
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Text(
                      'Category 1',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Category 2',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
                labelColor: MyColors.btnColor,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [Catagory(), Catagory2()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Catagory extends StatelessWidget {
  Catagory({super.key});
  final TextEditingController userController = TextEditingController();
  final FormController formController = FormController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Stack(children: [
            SizedBox(
              height: 158.h,
              width: 168.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(
                  'assets/images/image.jpeg',
                  height: 158.h,
                  width: 158.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 115,
              left: 140,
              child: Container(
                  height: 36.h,
                  width: 34.w,
                  decoration: BoxDecoration(
                      color: MyColors.darkBlue, shape: BoxShape.circle),
                  child: Icon(
                    Icons.person,
                    size: 22,
                    color: MyColors.white,
                  )),
            )
          ]),
          SizedBox(
            height: 16.h,
          ),
          Center(
            child: CustomTextFormField(
              validator: (value) =>
                  formController.validateUserName(value ?? ''),
              controller: userController,
              text: 'Vishal',
              title: 'User Name',
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff222222)),
              icon: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Center(
            child: CustomTextFormField(
              validator: (value) => formController.validateEmail(value ?? ''),
              controller: emailController,
              text: 'name1234@gmail.com',
              title: 'Email',
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff222222)),
              icon: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Center(
            child: Obx(
              () => CustomTextFormField(
                obscureText: formController.obscureText.value,
                validator: (value) =>
                    formController.validatePassword(value ?? ''),
                controller: passwordController,
                text: '****************',
                title: 'Password',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff222222),
                ),
                icon: IconButton(
                    onPressed: () {
                      formController.togglePasswordVisibility();
                    },
                    icon: Icon(formController.obscureText.value
                        ? Icons.visibility_off
                        : Icons.visibility)),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomizeButton(
            borderColor: MyColors.btnColor,
            radius: 100.r,
            text: 'Update',
            height: 40.h,
            width: 334.w,
            color: MyColors.btnColor,
            textColor: MyColors.white,
            onTap: () {
              Get.to(() => AddProjects());
            },
          ),
          SizedBox(
            height: 53.h,
          ),
        ],
      ),
    );
  }
}

class Catagory2 extends StatelessWidget {
  const Catagory2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: TextWidget(
              text: 'Project name',
              color: MyColors.black,
              size: 17,
              fontweight: FontWeight.w500,
            ),
            subtitle: TextWidget(
              text:
                  "Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.",
              color: MyColors.black,
              size: 14,
              fontweight: FontWeight.w500,
            ),
            trailing: TextWidget(
              text: '17 days ago',
              color: MyColors.grey,
              size: 12,
              fontweight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 300.h,
          ),
          CustomizeButton(
            borderColor: MyColors.btnColor,
            radius: 100.r,
            text: 'Update',
            height: 40.h,
            width: 334.w,
            color: MyColors.btnColor,
            textColor: MyColors.white,
            onTap: () {
              Get.to(() => AddProjects());
            },
          ),
          SizedBox(
            height: 53.h,
          ),
        ],
      ),
    );
  }
}
