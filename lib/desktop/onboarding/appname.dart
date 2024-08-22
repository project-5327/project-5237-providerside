import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../presentation/constants/assets.dart';
import '../../presentation/constants/strings.dart';


class AppNameScreen extends StatefulWidget {
  const AppNameScreen({super.key});

  @override
  State<AppNameScreen> createState() => _AppNameScreenState();
}

class _AppNameScreenState extends State<AppNameScreen> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Stack(
        children: [
          SvgPicture.asset(
            Assets.rectangle1,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
         const Center(
            child: Text(
              AppStrings.appName,
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black45,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
