// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:project_5237_provider/routes/routes.dart';

import '../desktop/onboarding/onboarding1.dart';
import '../presentation/screens/dashboard/dashboard_view.dart';
import '../presentation/screens/login_register/login.dart';
import '../presentation/screens/main_screen .dart';
import '../presentation/screens/splash screen.dart';

class PageRoutes {
  PageRoutes._();

  static const String INITIALMOBILE = Routes.splashScreen;
  static const String INITIALDESKTOP = Routes.loginPage;

  // Define all available routes using a Map.
  static Map<String, WidgetBuilder> routes = {
    Routes.dashboard: (context) => const DashBoardView(),
    Routes.mainScreen: (context) => MainScreen(),
    Routes.splashScreen: (context) => const SplashScreen(),
    Routes.onbarodingScreen1: (context) => const OnbarodingScreen1(),
    Routes.loginPage: (context) => LoginScreen(),
  };
}
