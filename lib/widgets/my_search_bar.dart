import 'package:cgms/config/constants.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  const MySearchBar({
    super.key,
    required this.controller,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: AppSizes.largeGap*1.5,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(AppSizes.smallGap),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Icon(Icons.search, color: Colors.grey, size: AppSizes.mediumIconSize),
           SizedBox(width: AppSizes.smallGap),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onTap: onTap,
              decoration:  InputDecoration(
                hintText: 'Search services',
                hintStyle: TextStyle(color: Colors.grey, fontSize: AppSizes.tertiaryFontSize*1.25),
                border: InputBorder.none,
              ),
              style:  TextStyle(fontSize: AppSizes.smallGap),
            ),
          ),
        ],
      ),
    );
  }
}
