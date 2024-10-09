import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:project_5237_provider/desktop/onboarding/onboarding1.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/provider/auth/login_provider.dart';
import 'package:project_5237_provider/provider/auth/register_provider.dart';
import 'package:project_5237_provider/provider/auth/verifyOTP_provider.dart';
import 'package:project_5237_provider/provider/date_time_provider.dart';
import 'package:project_5237_provider/provider/filter_provider.dart';
import 'package:project_5237_provider/provider/freelancer_provider/freelancer_provider.dart';
import 'package:project_5237_provider/provider/home/proposal_provider.dart';
import 'package:project_5237_provider/provider/onboarding/onbaording_provider.dart';
import 'package:project_5237_provider/provider/onboarding/project_provider.dart';
import 'package:project_5237_provider/provider/home/home_provider.dart';
import 'package:provider/provider.dart';
import 'config/baseclient/base_client.dart';
import 'presentation/screens/splash screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BaseClient.initialize("https://project5237.zatest.biz");
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginProvider()),
      ChangeNotifierProvider(create: (context) => VerifyOTPProvider()),
      ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ChangeNotifierProvider(create: (context) => HomeProvider()),
      ChangeNotifierProvider(create: (context) => OnbaordingProvider()),
      ChangeNotifierProvider(create: (_) => ProposalProvider()),
      ChangeNotifierProvider(create: (_) => FilterProvider()),
      ChangeNotifierProvider(create: (_) => ProjectProvider()),
      ChangeNotifierProvider(create: (_) => FreelancerProvider()),
      ChangeNotifierProvider(create: (_) => DateTimeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return ScreenUtilInit(
      designSize: responsive.isMobile
          ? const Size(375, 812)
          : responsive.isTablet
              ? const Size(1024, 1768)
              : const Size(1440, 941),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              textTheme:
                  GoogleFonts.interTextTheme(Theme.of(context).textTheme),
              appBarTheme: const AppBarTheme(
                surfaceTintColor: Colors.white,
                backgroundColor: Colors.white,
                scrolledUnderElevation: 0,
              ),
              useMaterial3: true,
            ),
            //  home: ProposalSendScreen(),
            home: responsive.isMobile || responsive.isTablet
                ? const SplashScreen()
                : const OnbarodingScreen1());
        //  ProfileEditScreen());

        //  Profile3());
      },
    );
  }
}

// class ProfileEditScreen extends StatefulWidget {
//   @override
//   _ProfileEditScreenState createState() => _ProfileEditScreenState();
// }

// class _ProfileEditScreenState extends State<ProfileEditScreen> {
//   File? _image;
//   final picker = ImagePicker();
//   String userName = "sadfffd";

//   Future<void> uploadProfile(File imageFile, String userName) async {
//     var dio = Dio();

//     var headers = {
//       'Authorization':
//           'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MDY0MTZhMmJhZWU0ZjA1MzQ3Yjk5NiIsImlzQ2xpZW50IjpmYWxzZSwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTcyODUwMDMwOCwiZXhwIjoxNzYwMDM2MzA4fQ.M9AHd8AAd_4JeVJY1MmdKz41QfQNn1qoBRnovc6_AYA'
//     };

//     var formData = FormData.fromMap({
//       'files': await MultipartFile.fromFile(imageFile.path,
//           filename: basename(imageFile.path)),
//       'userName': userName,
//     });

//     try {
//       var response = await dio.put(
//         'https://project5237.zatest.biz/api/auth/edit-profile',
//         options: Options(headers: headers),
//         data: formData,
//       );

//       if (response.statusCode == 200) {
//         // Check if the image URL is valid
//         String imageUrl = response.data['data']['profileImg'];

//         if (imageUrl.contains('undefined')) {
//           print("Warning: Image URL is invalid.");
//           // You might want to set a default image URL here
//           imageUrl =
//               "https://example.com/default-image.png"; // Use a placeholder image
//         }

//         print("Response data: ${jsonEncode(response.data)}");
//         print("User Name: ${response.data['data']['userName']}");
//         print("Profile Image URL: $imageUrl");
//       } else {
//         print("Error: ${response.statusMessage}");
//       }
//     } catch (e) {
//       print("Exception occurred: $e");
//     }
//   }

//   Future<void> _pickImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     } else {
//       print('No image selected.');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Column(
//         children: <Widget>[
//           _image == null ? Text('No image selected.') : Image.file(_image!),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _pickImage,
//             child: Text('Pick Image'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (_image != null) {
//                 uploadProfile(_image!, userName);
//               } else {
//                 print("Please select an image first");
//               }
//             },
//             child: Text('Upload Profile'),
//           ),
//         ],
//       ),
//     );
//   }
// }
