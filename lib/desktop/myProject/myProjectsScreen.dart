import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/desktop/widgets/projectComponent.dart';

import '../../presentation/constants/color.dart';
import '../../presentation/constants/strings.dart';
import '../../presentation/widgets/customize_button.dart';

class MyProjectsScreen extends StatefulWidget {
  const MyProjectsScreen({super.key});

  @override
  State<MyProjectsScreen> createState() => _MyProjectsScreenState();
}

class _MyProjectsScreenState extends State<MyProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
              padding: EdgeInsets.all(0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 2.3),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProjectComp();
              },
            ),
          ),
        ),
        SizedBox(
          height: 150.h,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CustomizeButton(
            borderColor: MyColors.btnColor,
            radius: 100.r,
            text: AppStrings.addProject,
            height: 40.h,
            width: 151.w,
            color: MyColors.btnColor,
            textColor: MyColors.white,
            onTap: () {
              //  Get.to(() => AddProjects());
            },
          ),
        ),
      ],
    );
  }
}
