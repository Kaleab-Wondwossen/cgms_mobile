import 'package:cgms/config/constants.dart';
import 'package:flutter/material.dart';

class CompanyLogosSlider extends StatelessWidget {
  final List<String> logoAssets = [
    'images/vodafone.png',
    'images/talkit.png',
    'images/amd.png',
    'images/intel.png',
    'images/tesla.png',

    // We can add more logos as needed
  ];

  CompanyLogosSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.largeGap * 1.5, // Adjust based on logo height
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.smallGap),
        itemCount: logoAssets.length,
        separatorBuilder: (context, index) =>
            SizedBox(width: AppSizes.mediumGap*1.5),
        itemBuilder: (context, index) {
          return Opacity(
            opacity: 0.5, // Reduce opacity for a faded effect
            child: Image.asset(
              logoAssets[index],
              height: AppSizes.largeGap,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
