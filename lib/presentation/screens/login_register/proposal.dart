import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/login_register/message.dart';
import 'package:project_5237_provider/presentation/widgets/booked_message.dart';


class ProposalScreen extends StatelessWidget {
  const ProposalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: BookedMessage(
                text: "\$Proposal accepted",
                text1:
                    "Lorem ipsum dolor sit amet consectetur. Etiam sollicitudin gravida et ornare.",
                btntext: 'Message',
                onTap: () {
                  Get.to(const MessageScreen());
                })),
      ),
    );
  }
}
