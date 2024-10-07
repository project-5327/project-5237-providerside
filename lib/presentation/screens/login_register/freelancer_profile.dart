import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/login_register/EditProfile.dart';
import 'package:project_5237_provider/presentation/screens/login_register/setting_screen.dart';
import 'package:project_5237_provider/presentation/screens/main_screen%20.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';

class FreelancerProfile extends StatefulWidget {
  const FreelancerProfile({super.key});

  @override
  State<FreelancerProfile> createState() => _FreelancerProfileState();
}

class _FreelancerProfileState extends State<FreelancerProfile> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // final clientProvider =
      //     Provider.of<ClientProvider>(context, listen: false);
      // clientProvider.fetchClientData(context).then((_) {});
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      } else {
        debugPrint('No image selected.');
        _selectedImage = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return
    // Consumer<ClientProvider>(builder: (context, clientProvider, child) {
    //   final client = clientProvider.clientDetails?.data?.userDetails;
    //   debugPrint("Client name =======> ${client?.user?.userName}");
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColors.black,
          ),
        ),
        title: Text(
          AppStrings.myProfile,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen()));
              },
            ),
          )
        ],
      ),
      body:
          // clientProvider.loading
          //     ? Center(
          //         child: CircularProgressIndicator(color: MyColors.blue),
          //       )
          //     :
          SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(children: [
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
                height: 70.h,
                width: 70.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.network(
                      "https://s3-alpha-sig.figma.com/img/3f16/acab/f42dbab07ac7002f3428f90210da277d?Expires=1728259200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cMZEA~D1zzHDYPI--zVMXN2IGQHuWUD6UAHMEreq6OaraVmJKvwBtpx2JnWdUWSB5BoR6XHuRiYZXdOnFadnSyFiO326DF5pIFZigIZKpCMCOsB-u9m-kdFtPv8Rkv0ku2xfV72wK6BQfxLzrrNvLwFkxS6hewo18cdDf6qjkkoOpYPuADBVEGvI589cEKqlMFa~EryEJTFBq-TO~yuLZKAp9MOuk2VW9c7x6Pnst7FEUggqqO44g0O4BGdUfkQfyWEVtE2ipzcjExcYORNPRvUY8FWW8v1M0bLtiFWKWPzts~Vm5fKdEJTUhPSbVRNKX-AnqZxjd7nTQJcNPrP~qw__",
                      // height: 148.h,
                      // width: 140.w,
                      fit: BoxFit.cover,
                    ))),
            Center(
              child: CustomTextFormField(
                controller: userController,
                //   ..text = client?.user?.userName ?? '',
                // text: client?.user?.userName ?? '',
                title: "Full Name",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black1,
                ),
                readOnly: true,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Center(
              child: CustomTextFormField(
                controller: emailController,
                //   ..text = client?.user?.email ?? '',
                // text: client?.user?.email ?? '',
                title: AppStrings.emailText,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black1,
                ),
                readOnly: true,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: CustomizeButton(
                borderColor: MyColors.btnColor,
                radius: 100.r,
                text: "Edit",
                height: 40.h,
                width: 100.w,
                color: MyColors.btnColor,
                textColor: MyColors.white,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Editprofile()));
                },
              ),
            ),
            SizedBox(
              height: 53.h,
            ),
          ]),
        ),
      ),
    ));
    //});
  }
}
