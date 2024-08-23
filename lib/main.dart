import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile3.dart';
import 'package:project_5237_provider/presentation/screens/login_register/Add_projects.dart';
import 'package:project_5237_provider/presentation/screens/login_register/profile_screen.dart';

import 'package:project_5237_provider/presentation/screens/splash%20screen.dart';

import 'presentation/screens/create_profile/profile/profile4.dart';
import 'presentation/screens/create_profile/profile/profile5.dart';
import 'presentation/screens/create_profile/profile/profile_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: defaultTargetPlatform == TargetPlatform.android ||
                defaultTargetPlatform == TargetPlatform.iOS
            ? const Size(375, 812)
            : const Size(1440, 941),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                textTheme:
                    GoogleFonts.interTextTheme(Theme.of(context).textTheme),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: Profile5());

          //  Profile3());
        });
  }
}
