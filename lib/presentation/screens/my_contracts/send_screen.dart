import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/contract_widgets.dart';
import 'my_project.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            SendDetails();
          },
          child: ProjectTile2(
              image: Assets.bag,
              title: 'Project 1',
              title1: 'Joseph Aina',
              subtitle: 'Monday, 5th January - 11:50pm',

              //$
              tralingtext: 'Rate',
              image1: Assets.profile),
        ),
        SizedBox(
          height: 20.h,
        ),
        ProjectTile2(
            image: Assets.bag,
            title: 'Project 2',
            title1: 'Tayo Israel',
            subtitle: 'Monday, 5th January - 11:50pm',

            //$
            tralingtext: 'Rate',
            image1: Assets.profile),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}

class SendDetails extends StatelessWidget {
  const SendDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () {
                Get.to(MyProjectScreen());
              },
              child: ProjectTile2(
                  image: Assets.bag,
                  title: 'Project 1',
                  title1: 'Joseph Aina',
                  subtitle: 'Monday, 5th January - 11:50pm',

                  //$
                  tralingtext: '',
                  image1: 'assets/images/girl2.png'),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextWidget(
              text: 'Date & Time',
              color: MyColors.black1,
              size: 13.sp,
              fontweight: FontWeight.w700,
            ),
            TextWidget(
              text: '09/07/2024 & 11:30 AM',
              color: Color(0xff555555),
              size: 13.sp,
              fontweight: FontWeight.w500,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextWidget(
              text: '\$Rate',
              color: MyColors.black1,
              size: 13.sp,
              fontweight: FontWeight.w700,
            ),
            TextWidget(
              text: '100',
              color: Color(0xff555555),
              size: 13.sp,
              fontweight: FontWeight.w500,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextWidget(
              text: 'Address',
              color: MyColors.black1,
              size: 13.sp,
              fontweight: FontWeight.w700,
            ),
            TextWidget(
              text: 'Lorem Ipsum is simply dummy text',
              color: Color(0xff555555),
              size: 13.sp,
              fontweight: FontWeight.w500,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextWidget(
              text: 'Attached Image',
              color: MyColors.black1,
              size: 13.sp,
              fontweight: FontWeight.w700,
            ),
            SizedBox(
              height: 10.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [PdfContainer(), PdfContainer()],
            ),
            SizedBox(
              height: 10.h,
            ),
            TextWidget(
              text: 'Description',
              color: MyColors.black1,
              size: 13.sp,
              fontweight: FontWeight.w700,
            ),
            TextWidget(
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              color: Color(0xff555555),
              size: 13.sp,
              fontweight: FontWeight.w500,
            ),
            SizedBox(
              height: 16.h,
            ),
            const Divider(
              color: Color(0xffEAEEF0),
              height: 1,
            ),
            SizedBox(
              height: 12.h,
            ),
            ProjectTile2(
                image: Assets.bag,
                title: 'Project 1',
                title1: 'Joseph Aina',
                subtitle: 'Monday, 5th January - 11:50pm',

                //$
                tralingtext: '',
                image1: 'assets/images/girl2.png'),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}

class PdfContainer extends StatelessWidget {
  const PdfContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57.h,
      width: 161.w,
      decoration: BoxDecoration(
        color: Color(0xffBEBEBE),
        border: Border.all(width: 1.16),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.pdf),
          SizedBox(
            width: 10.w,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Image.pdf'),
              Text('643'),
            ],
          )
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  final size;
  final fontFamily;
  final Color color;
  final TextAlign? align;
  final fontweight;
  const TextWidget(
      {super.key,
      required this.text,
      this.size,
      required this.color,
      this.fontweight,
      this.align,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      text,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: size,
          fontWeight: fontweight,
          color: color),
    );
  }
}
