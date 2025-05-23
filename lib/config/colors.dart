import 'package:flutter/material.dart';

// Define all colors as variables
class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xFF6200EE); // Deep purple
  static const Color primaryTextColor = Colors.black; // Black
  static const Color onPrimaryColor = Colors.white; // White (for text/icons on primary color)

  // Secondary Colors
  static const Color secondaryColor = Color(0xFF03DAC6); // Teal
  static const Color onSecondaryColor = Colors.black; // Black (for text/icons on secondary color)

  // Background Colors
  static const Color backgroundColor = Colors.white; // White
  static const Color cardBackgroundColor = Color(0xFFF5F5F5); // Light gray for cards

  // Text Colors
  static const Color primaryText = Colors.black; // Black
  static const Color secondaryText = Color(0xFF757575); // Gray

  // Accent Colors
  static const Color accentColor = Color(0xFFFF4081); // Pink
  static const Color onAccentColor = Colors.white; // White (for text/icons on accent color)

  // Highlight Colors
  static const Color highlightColor = Color(0xFFFFD740); // Amber for highlights
  static const Color onHighlightColor = Colors.black; // Black (for text/icons on highlight color)

  // Icon Colors
  // static const Color primaryIconColor = Color.fromRGBO(48, 111, 183, 1); // Black
  // static const Color secondaryIconColor = Color.fromRGBO(96, 132, 173, 1); // Gray

  static const Color primaryIconColor = Color.fromRGBO(58, 111, 91, 1); // Black
  static const Color secondaryIconColor = Color.fromRGBO(114, 181, 155, 1); // Gray


  // Button Colors
  static const Color primaryButtonColor = Color(0xFF6200EE); // Deep purple
  static const Color secondaryButtonColor = Color(0xFF03DAC6); // Teal
  static const Color onPrimaryButtonColor = Colors.white; // White (for text/icons on primary button)
  static const Color onSecondaryButtonColor = Colors.black; // Black (for text/icons on secondary button)

  // Additional Colors (Optional)
  static const Color errorColor = Colors.red; // For error messages
  static const Color successColor = Colors.green; // For success messages
}

/*
Primary Color (#6200EE): AppBar, primary buttons.

Secondary Color (#03DAC6): Highlights, icons, secondary buttons.

Background Color (#FFFFFF): Scaffold background, card backgrounds.

Text Colors: Black (#000000) for primary text, gray (#757575) for secondary text.

Accent Color (#FF4081): Call-to-action buttons (e.g., "Sign Up", "Learn-More").
*/