import 'package:flutter/material.dart';

class AppColors {
  // Monochrome Color Palette
  static const Color primaryBlack = Color(0xFF000000);
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color darkGrey = Color(0xFF1A1A1A);
  static const Color mediumGrey = Color(0xFF333333);
  static const Color lightGrey = Color(0xFF666666);
  static const Color veryLightGrey = Color(0xFF9E9E9E);
  static const Color backgroundGrey = Color(0xFFF5F5F5);
  static const Color borderGrey = Color(0xFFE0E0E0);
  static const Color shadowGrey = Color(0x1A000000);

  // Text Colors
  static const Color primaryText = primaryBlack;
  static const Color secondaryText = lightGrey;
  static const Color disabledText = veryLightGrey;

  // Status Colors (monochrome variations)
  static const Color success = Color(0xFF2E2E2E);
  static const Color error = primaryBlack;
  static const Color warning = mediumGrey;
  static const Color info = lightGrey;
}
