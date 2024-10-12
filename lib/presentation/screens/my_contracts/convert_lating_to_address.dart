import 'package:flutter/material.dart';

class ConvertLatingToAddress extends StatefulWidget {
  const ConvertLatingToAddress({super.key});

  @override
  State<ConvertLatingToAddress> createState() => _ConvertLatingToAddressState();
}

class _ConvertLatingToAddressState extends State<ConvertLatingToAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
        Container(
          height:50,child:const Center(child: Text('convert')),
        )
      ],),
    );
  }
}