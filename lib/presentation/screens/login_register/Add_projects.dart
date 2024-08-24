// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/screens/login_register/succesfully.dart';
import '../../constants/color.dart';
import '../../constants/strings.dart';
import '../../widgets/Details_textfield.dart';

class AddProjects extends StatelessWidget {
  const AddProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobile(),
      tablet: _mobile(),
      desktop: _desktop(),
    );
  }

  Widget _mobile() {
    return Scaffold(
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
          Get.to(() => const SuccesfullyScreen());
        },
      )),
    );
  }

  Widget _desktop() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 500,
            child: SingleChildScrollView(child: DetailsTextfield(
              onTap: () {
                Get.to(() => const SuccesfullyScreen());
              },
            )),
          ),
        ),
      ),
    );
  }
}
