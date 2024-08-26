import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/desktop/onboarding/onboarding1.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'presentation/screens/splash screen.dart';

void main() {
  runApp(const MyApp());
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
              ? Size(1024, 1768)
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
          home: responsive.isMobile || responsive.isTablet
              ? SplashScreen()
              : OnbarodingScreen1(),
        );

        //  Profile3());
      },
    );
  }
}
