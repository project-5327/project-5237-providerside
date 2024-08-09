import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/login_register/succesfully.dart';

import '../../constants/color.dart';
import '../../widgets/Details_textfield.dart';

class AddProjects extends StatelessWidget {
  const AddProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: MyColors.black,
        ),
        title: Text(
          'Add your Project',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: DetailsTextfield(
                onTap: () {
                  Get.to(() => SuccesfullyScreen());
                },
              ))),
    );
  }
}
