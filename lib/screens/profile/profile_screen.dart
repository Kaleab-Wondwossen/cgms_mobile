import 'package:cgms/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../config/constants.dart';
import '../../widgets/profile_personal_info_container.dart';
import '../../widgets/profile_utilities_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    AppSizes.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CGMS',
          style: GoogleFonts.acme(
            fontSize: AppSizes.primaryFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: AppColors.primaryIconColor,
            onPressed: () {
              // Handle notifications
              debugPrint('Notifications tapped');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            color: AppColors.primaryIconColor,
            onPressed: () {
              // Navigate to settings
              Navigator.pushNamed(context, '/Settings');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: AppSizes.smallGap),
                CircleAvatar(
                  radius: AppSizes.mediumGap * 2.5,
                  backgroundImage: const AssetImage('images/logo.png'),
                ),
                SizedBox(height: AppSizes.smallGap),
                Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: AppSizes.primaryFontSize,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color, // Use theme color
                  ),
                ),
                Text(
                  "Active Since : Aug 21 2013",
                  style: TextStyle(
                    fontSize: AppSizes.tertiaryFontSize,
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color, // Use theme color
                  ),
                ),
                SizedBox(height: AppSizes.mediumGap),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      AppSizes.mediumGap, 0, AppSizes.smallGap, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          fontSize: AppSizes.secondaryFontSize * .85,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color, // Use theme color
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            AppSizes.largeGap * 3.6, 0, 0, 0),
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: AppSizes.tertiaryFontSize,
                            color: const Color.fromRGBO(56, 103, 93, 1.0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Color.fromRGBO(56, 103, 93, 1.0),
                        ),
                        iconSize: AppSizes.smallIconSize,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppSizes.mediumGap),
                  child: authProvider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : authProvider.user == null
                          ? const Center(child: Text("No user data found."))
                          : PersonalInfoContainer(user: authProvider.user!),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(0, 0, AppSizes.mediumGap * 13, 0),
                  child: Text(
                    "Utilities",
                    style: TextStyle(
                      fontSize: AppSizes.secondaryFontSize * .85,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color, // Use theme color
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppSizes.mediumGap),
                  child: const UtilitiesContainer(),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginScreen()),
                    // );
                  },
                  child: Container(
                    height: AppSizes.mediumGap * 2.5,
                    width: AppSizes.largeGap * 10,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppSizes.smallGap)),
                      color: const Color.fromRGBO(232, 232, 232, 1),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: AppSizes.mediumGap),
                        Icon(
                          Icons.logout,
                          size: AppSizes.mediumIconSize,
                          color: Colors.red,
                        ),
                        SizedBox(width: AppSizes.smallGap),
                        Text(
                          "Logout",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.secondaryFontSize,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
