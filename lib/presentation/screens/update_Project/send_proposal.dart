import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/color.dart';
import '../../widgets/Details_textfield.dart';
import '../login_register/succesfully.dart';

class SendProposalScreen extends StatefulWidget {
  const SendProposalScreen({super.key});

  @override
  State<SendProposalScreen> createState() => _SendProposalScreenState();
}

class _SendProposalScreenState extends State<SendProposalScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyColors.black,
            ),
          ),
          title: Text(
            'Send Proposal',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: DetailsTextfield(
                  onTap: () {
                    Get.to(() => const SuccesfullyScreen());
                  },
                ))),
      ),
    );
  }
}
