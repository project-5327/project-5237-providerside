import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/my_account.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile2.dart';
import 'package:project_5237_provider/presentation/screens/login_register/add_project1.dart';
import 'package:project_5237_provider/presentation/screens/login_register/credit.dart';
import 'package:project_5237_provider/presentation/screens/login_register/register.dart';

import 'presentation/screens/create_profile/profile/profile3.dart';
import 'presentation/screens/login_register/Add_projects.dart';
import 'presentation/screens/splash screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
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
              home: SplashScreen());
        });
  }
}
