import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../presentation/constants/assets.dart';
import '../../presentation/constants/color.dart';
import '../../presentation/constants/strings.dart';
import 'appname.dart';

class CreateYourProfileScreen extends StatefulWidget {
  const CreateYourProfileScreen({super.key});

  @override
  State<CreateYourProfileScreen> createState() => _CreateYourProfileScreenState();
}

class _CreateYourProfileScreenState extends State<CreateYourProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AppNameScreen(),
          Flexible(
            flex: 2,
            child: Center(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.createProfile,
                      width: 200,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Hey John. Ready for your\nnext big opportunity?',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2A1E17), // Ensure consistent text color
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Build a profile to show the world what you can do',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff2A1E17),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    _buildDivider(),
                    const SizedBox(height: 20),
                    const Text(
                      'Apply on jobs posted from clients, around the world',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff2A1E17),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    _buildDivider(),
                    const SizedBox(height: 20),
                    const Text(
                      'Get paid safely and know we\'re here to help',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff2A1E17),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.btnColor,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          textStyle: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Create Profile', // Ensure this matches your string resources
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



Widget _buildDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 80.0),
    child: Divider(
      color: const Color(0xff2A1E17),
      thickness: 1,
    ),
  );
}