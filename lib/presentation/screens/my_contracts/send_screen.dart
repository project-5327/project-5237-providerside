import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../widgets/contract_widgets.dart';

class SendScreen extends StatefulWidget {
  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  int? expandedIndex;

  void _handleProjectTileTap(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          InkWell(
            onTap: () => _handleProjectTileTap(0),
            child: ProjectTile2(
              image: Assets.bag,
              title: 'Project 1',
              title1: 'Joseph Aina',
              subtitle: 'Monday, 5th January - 11:50pm',
              trailingText: '\$Rate',
              image1: 'assets/images/girl2.png',
              isExpanded: expandedIndex == 0,
            ),
          ),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () => _handleProjectTileTap(1),
            child: ProjectTile2(
              image: Assets.bag,
              title: 'Project 2',
              title1: 'Tayo Israel',
              subtitle: 'Monday, 5th January - 11:50pm',
              trailingText: '\$Rate',
              image1: 'assets/images/girl2.png',
              isExpanded: expandedIndex == 1,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class PdfContainer extends StatefulWidget {
  const PdfContainer({super.key});

  @override
  _PdfContainerState createState() => _PdfContainerState();
}

class _PdfContainerState extends State<PdfContainer> {
  String fileName = 'Choose File';
  String fileSize = '0 KB';

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      // Get the file name and size
      setState(() {
        fileName = result.files.first.name;
        fileSize =
            '${result.files.first.size / 1024} KB'; // Convert bytes to KB
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickFile,
      child: Container(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fileName), // Display the selected file name
                Text(fileSize), // Display the file size
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  final size;
  final String? fontFamily;
  final TextAlign? align;
  final Color color;
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
      textAlign: align ?? TextAlign.start,
      text,
      style: TextStyle(
          fontFamily: fontFamily ?? 'Montserrat',
          fontSize: size,
          fontWeight: fontweight,
          color: color),
    );
  }
}
