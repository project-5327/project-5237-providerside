import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/contract_widgets.dart';
import '../login_register/home_screen.dart';

import '../update_Project/chat_screen.dart';

class HandShakeTick extends StatefulWidget {
  const HandShakeTick({super.key});

  @override
  State<HandShakeTick> createState() => _HandShakeTickState();
}

class _HandShakeTickState extends State<HandShakeTick> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.h,
          ),
          ProjectTile1(
            image: Assets.bag,
            title: 'Project 3',
            title1: 'Abiodun Taiwo',
            subtitle: 'Monday, 5th January - 11:50pm',
            tralingicon: Assets.message,
            tralingtext: '\$Rate',
            btnText: 'Booked',
            btnColor: MyColors.grey2,
            btntextColor: MyColors.black1,
            image1: 'assets/images/girl2.png',
          ),
          SizedBox(
            height: 20.h,
          ),
          ProjectTile1(
              image: Assets.bag,
              title: 'Project 4',
              title1: 'Abiodun Taiwo',
              subtitle: 'Monday, 5th January - 11:50pm',
              tralingicon: Assets.message,
              //$
              tralingtext: '\$Rate',
              btnText: 'Done',
              btnColor: MyColors.green,
              btntextColor: MyColors.white,
              image1: 'assets/images/girl2.png'),
          SizedBox(
            height: 20.h,
          ),
          ProjectTile1(
              image: Assets.bag,
              title: 'Project 5',
              title1: 'Ismail Ojo',
              subtitle: 'Monday, 5th January - 11:50pm',
              tralingicon: Assets.message,
              //$
              tralingtext: '\$Rate',
              btnText: 'Canceled',
              btntextColor: MyColors.red,
              btnColor: MyColors.lightred,
              image1: 'assets/images/girl2.png'),
        ],
      ),
    );
  }
}
