import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/constants.dart';

class MyBytton extends StatefulWidget {
  final double height;
  final double width;
  final String btnName;
  const MyBytton({super.key, required this.height, required this.width, required this.btnName});

  @override
  State<MyBytton> createState() => _MyByttonState();
}

class _MyByttonState extends State<MyBytton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.largeGap),
          color: AppColors.primaryIconColor,
        ),
        child: Center(
          child: Text(widget.btnName, style: TextStyle(
            fontSize: AppSizes.secondaryFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),),
        ),
      ),
    );
  }
}
