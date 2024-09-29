import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/data/models/proposal_by_user.dart';
import 'package:project_5237_provider/desktop/onboarding/onboarding1.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';

import 'package:project_5237_provider/provider/auth/login_provider.dart';
import 'package:project_5237_provider/provider/auth/register_provider.dart';
import 'package:project_5237_provider/provider/auth/verifyOTP_provider.dart';
import 'package:project_5237_provider/provider/filter_provider.dart';
import 'package:project_5237_provider/provider/freelancer_provider/freelancer_provider.dart';
import 'package:project_5237_provider/provider/home/proposal_provider.dart';
import 'package:project_5237_provider/provider/onboarding/onbaording_provider.dart';
import 'package:project_5237_provider/provider/onboarding/project_provider.dart';
import 'package:project_5237_provider/routes/page_routes.dart';
import 'package:project_5237_provider/provider/home/home_provider.dart';
import 'package:provider/provider.dart';

import 'config/baseclient/base_client.dart';
import 'desktop/onboarding/onboarding3.dart';
import 'desktop/projects/projects_screen.dart';
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
      ChangeNotifierProvider(create: (context) => HomeProvider()),
      ChangeNotifierProvider(create: (context) => OnbaordingProvider()),
      ChangeNotifierProvider(create: (_) => ProposalProvider()),
      ChangeNotifierProvider(create: (_) => FilterProvider()),
      ChangeNotifierProvider(create: (_) => ProjectProvider()),
      ChangeNotifierProvider(create: (_) => FreelancerProvider()),
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
          //  home: ProposalSendScreen(),
          home: responsive.isMobile || responsive.isTablet
              ? SplashScreen()
              : OnbarodingScreen1(),
        );

        //  Profile3());
      },
    );
  }
}
