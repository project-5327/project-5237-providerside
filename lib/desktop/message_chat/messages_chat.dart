import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/desktop/message_chat/dailogs.dart';

import '../../presentation/constants/color.dart';

import 'catogories.dart';

class MessageChatScreen1 extends StatefulWidget {
  const MessageChatScreen1({super.key});

  @override
  State<MessageChatScreen1> createState() => _MessageChatScreen1State();
}

class _MessageChatScreen1State extends State<MessageChatScreen1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom AppBar-like widget
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      'Messages',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(text: 'Client'),
                    Tab(text: 'Send Proposal'),
                    Tab(text: 'Miscellaneous')
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.h),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: const Color(0xff999999))),
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: 20.h, right: 20.w, left: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.h, left: 50.w),
                            ),
                            // Message list
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: const [
                                  Catagory3(),
                                  Catagory3(),
                                  Catagory3(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color:
                            Color(0xff999999), // The color of the divider line
                        thickness: 1, // The thickness of the divider line
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          child: const ChatScreen1(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatScreen1 extends StatefulWidget {
  const ChatScreen1({super.key});

  @override
  State<ChatScreen1> createState() => _ChatScreen1State();
}

class _ChatScreen1State extends State<ChatScreen1> {
  List<Message> messages = [
    Message(
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the text ever since the 1500s, when an unknown.",
      isSentByMe: false,
      time: '1:30 PM',
    ),
    Message(
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      isSentByMe: true,
      time: '1:30 PM',
    ),
    Message(
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the text ever since the 1500s, when an unknown.",
      isSentByMe: false,
      time: '1:30 PM',
    ),
  ];

  TextEditingController messageController = TextEditingController();

  /*void _handlePopUpItem(String value, BuildContext context) {}*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                            8.0), // Fixed padding for the profile picture
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/wgirl1.png',
                            height: 40.h, // Fixed height
                            width: 40.w, // Fixed width
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Jason Jones',
                        style: TextStyle(
                          fontSize: 20.sp, // Fixed font size
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      PopupMenuButton<String>(
                        onSelected: (value) =>
                            CustomDailogs().handlePopUpItem(value, context),
                        constraints: const BoxConstraints(
                          maxWidth: 120, // Fixed width
                        ),
                        itemBuilder: (BuildContext context) {
                          return {"Block", "Report", "Remove"}
                              .map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice.toLowerCase(),
                              child: Container(
                                height: 30.h, // Fixed height
                                width: 100.w, // Fixed width
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    choice,
                                    style: TextStyle(
                                      color: const Color(0xff2C62B9),
                                      fontSize: 12.sp, // Fixed font size
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Color(0xff999999),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Align(
                    alignment: message.isSentByMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w, // Fixed padding
                        vertical: 4.h, // Fixed padding
                      ),
                      child: Column(
                        crossAxisAlignment: message.isSentByMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: 250.w),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: message.isSentByMe
                                  ? const Color(0xff2C62B9)
                                  : const Color(0xff2C62B9),
                              borderRadius: message.isSentByMe
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    )
                                  : const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                            ),
                            child: Text(
                              message.text,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            message.time,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w, // Fixed padding
                vertical: 8.h, // Fixed padding
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Type Something...',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.h, // Fixed padding
                          horizontal: 12.w, // Fixed padding
                        ),
                        fillColor: const Color(0xffF1F1F1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: const Icon(
                          Icons.emoji_emotions,
                          color: Colors.white,
                          size: 24, // Fixed icon size
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                icon: const Icon(
                                  Icons.attach_file,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 50.h,
                    width: 71.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffF1F1F1),
                      border: Border.all(color: MyColors.grey),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Color(0xffB9B9B9),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isSentByMe;
  final String time;
  final bool isFavorite;

  Message({
    required this.text,
    required this.isSentByMe,
    required this.time,
    this.isFavorite = false,
  });
}
