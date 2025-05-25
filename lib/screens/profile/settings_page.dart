import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/constants.dart';
import '../../widgets/settings_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_circle_left_rounded,
            color: Color.fromRGBO(56, 103, 93, 1.0),
          ),
          iconSize: AppSizes.largeIconSize,
        ),
        title: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, AppSizes.largeGap * 5.5, 0),
          child: Text(
            'Settings',
            style: GoogleFonts.acme(
                fontWeight: FontWeight.bold,
                fontSize: AppSizes.primaryFontSize),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: AppSizes.largeGap,
          ),
          const SettingsContainer(
            icon:  Icon(Icons.notifications),
            color
                :  Color.fromRGBO(236, 236, 236, 1),
          ),
          const SettingsContainer(
            name: "Change Password",
            icon:  Icon(Icons.key),
            color
                :  Color.fromRGBO(210, 220, 217, 1),
          ),
          const SettingsContainer(
            name: "Privacy and Security",
            icon:  Icon(Icons.people),
            color:  Color.fromRGBO(236, 236, 236, 1),
          ),
          const SettingsContainer(
            name: "Community Guidelines",
            icon:  Icon(Icons.archive),
            color:  Color.fromRGBO(210, 220, 217, 1),
          ),
          const SettingsContainer(
            name: "Terms of Services",
            icon:  Icon(Icons.settings),
            color:   Color.fromRGBO(236, 236, 236, 1),
          ),
          const SettingsContainer(
            name: "Privacy Policy",
            icon:  Icon(Icons.privacy_tip),
            color:   Color.fromRGBO(210, 220, 217, 1),
          ),
          const SettingsContainer(
            name: "FAQ",
            icon:  Icon(Icons.question_mark),
            color:   Color.fromRGBO(236, 236, 236, 1),
          ),
          SizedBox(
            height: AppSizes.largeGap,
          ),
          ListTile(
            title: Text(
              'Dark Mode',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: AppSizes.secondaryFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
