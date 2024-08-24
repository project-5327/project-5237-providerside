import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/presentation/screens/dashboard/dashboard_view.dart';
import 'package:project_5237_provider/presentation/screens/login_register/add_project1.dart';

import 'presentation/screens/login_register/Add_projects.dart';

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
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
            appBarTheme: const AppBarTheme(
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
            ),
            useMaterial3: true,
          ),
          home: const DashBoardView(),
        );

        //  Profile3());
      },
    );
  }
}
