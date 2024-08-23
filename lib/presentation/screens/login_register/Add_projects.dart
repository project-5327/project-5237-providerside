import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile_detail.dart';
import 'package:project_5237_provider/presentation/screens/login_register/add_project1.dart';
import 'package:project_5237_provider/presentation/screens/login_register/succesfully.dart';

import '../../constants/color.dart';
import '../../constants/strings.dart';
import '../../widgets/Details_textfield.dart';

class AddProjects extends StatelessWidget {
  const AddProjects({super.key});

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
            AppStrings.addYourProjects,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(child: DetailsTextfield(
          onTap: () {
            Get.to(() => ProfileDetail());
          },
        )),
      ),
    );
  }
}
