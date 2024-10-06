
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/components/profile8widget.dart';

import '../../../../controller/country_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../constants/strings.dart';
import 'static_profile.dart';

class Profile8 extends StatefulWidget {
  const Profile8({super.key});

  @override
  State<Profile8> createState() => _Profile8State();
}

class _Profile8State extends State<Profile8> {
  final formKey = GlobalKey<FormState>();
  final ProfileController profileController = Get.put(ProfileController());
  final FormController formController = Get.put(FormController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final DropdownController dropdownController = Get.put(DropdownController());
  final List<String> countries = ['USA', 'India', 'Canada', 'Japan'];
  final List<String> city = ['Delhi', 'Gurugram', 'Noida'];

  final ImagePicker _picker = ImagePicker();

  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StaticProfileLayout(
        middleContentBuilder: () =>
            const Profile8widget()); /*ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _mobileView(context),
    );*/
  }

  _mobileView(BuildContext context) {
    StaticProfileLayout(middleContentBuilder: () => const Profile8widget());
  }

  _deskTopView(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      Flexible(
        child: Container(
          child: SvgPicture.asset(
            Assets.createProfile1,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Flexible(
          child: SingleChildScrollView(
        child: Center(
            child: SizedBox(
                //  height: 450.h,
                width: 336.w,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 100.h),
                      Row(
                        children: [
                          Text(
                            AppStrings.createProfile,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: MyColors.black,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 100.w),
                          Obx(() => Text(
                                '${profileController.currentIndex.value + 1}/8',
                                style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      LinearProgressIndicator(
                        value: (profileController.currentIndex.value + 1) / 8,
                        color: MyColors.btnColor,
                        borderRadius: BorderRadius.circular(4.r),
                        minHeight: 5.h,
                      ),
                      SizedBox(height: 30.h),
                      const Profile8widget(),
                      SizedBox(height: 70.h),
                    ]))),
      ))
    ]));
  }
}
