import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/desktop/onboarding/onboarding1.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/desktop/projects/project_detail_screen.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile8.dart';
import 'package:project_5237_provider/presentation/screens/dashboard/dashboard_view.dart';
import 'package:project_5237_provider/presentation/screens/login_register/add_project1.dart';
import 'package:project_5237_provider/presentation/screens/login_register/profile_screen.dart';
import 'package:project_5237_provider/presentation/screens/message/forget_password.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/map_screen.dart';
import 'package:project_5237_provider/provider/auth/login_provider.dart';
import 'package:project_5237_provider/provider/auth/register_provider.dart';
import 'package:project_5237_provider/provider/auth/verifyOTP_provider.dart';
import 'package:project_5237_provider/routes/page_routes.dart';
import 'package:provider/provider.dart';

import 'config/baseclient/base_client.dart';
import 'desktop/onboarding/onboarding3.dart';
import 'presentation/screens/login_register/Add_projects.dart';
import 'presentation/screens/splash screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BaseClient.initialize("https://project5237.zatest.biz");
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginProvider()),
      ChangeNotifierProvider(create: (context) => VerifyOTPProvider()),
      ChangeNotifierProvider(create: (context) => RegisterProvider()),
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
