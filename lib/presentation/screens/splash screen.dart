import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_5237_provider/desktop/onboarding/onboarding1.dart';
import 'package:project_5237_provider/desktop/onboarding/onboarding3.dart';
import 'package:project_5237_provider/desktop/projects/projects_screen.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/create_your_profile.dart';
import 'package:project_5237_provider/presentation/screens/milestones/milestone.dart';
import 'dart:async';
import '../constants/assets.dart';
import 'create_profile/my_account.dart';
import 'login_register/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SvgPicture.asset(
        Assets.splashScreen,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      )),
    );
  }
}
