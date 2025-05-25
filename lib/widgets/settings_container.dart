import 'package:flutter/material.dart';

import '../config/constants.dart';

class SettingsContainer extends StatelessWidget {
  final String name;
  final Icon icon;
  final Color color;
  const SettingsContainer(
      {super.key,
      this.name = "Notification",
      this.icon = const Icon(Icons.notification_add, color: Color.fromRGBO(56, 103, 93, 1.0),),
      this.color = const Color.fromRGBO(236, 236, 236,1)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(AppSizes.mediumGap,AppSizes.smallGap,AppSizes.mediumGap,0),
      child: Container(
        height: AppSizes.largeGap*1.5,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppSizes.smallGap)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.fromLTRB(AppSizes.mediumGap,0, AppSizes.mediumGap,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  icon,
                  Text(name, style: TextStyle(
                    fontSize: AppSizes.primaryFontSize*.8,
                  ),),
                   Icon(Icons.arrow_forward_ios, size: AppSizes.mediumIconSize,)
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(AppSizes.mediumGap,0,AppSizes.mediumGap,0),
              child: Divider(
                thickness: AppSizes.smallGap*.1,
                color: const Color.fromRGBO(56, 103, 93, 1.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
