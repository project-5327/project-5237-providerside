import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/booked_message.dart';
import 'message.dart';

class BookedClient extends StatelessWidget {
  const BookedClient({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: BookedMessage(
                text: "\$Clientname booked!",
                text1:
                    "Lorem ipsum dolor sit amet consectetur. Etiam sollicitudin gravida et ornare.",
                btntext: 'Done',
                onTap: () {
                  //  Get.to(());
                })),
      ),
    );
  }
}
