// theme.dart

import 'package:flutter/material.dart';

class DesignSystemTheme {
  // Colors
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color primaryVariant = Color(0xFF3700B3);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color secondaryVariant = Color(0xFF018786);
  static const Color backgroundColor = Color(0xFFF6F6F6);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFB00020);
  static const Color textColor = Color(0xFF000000);

  // Typography
  static const TextStyle headline1 = TextStyle(
      fontSize: 96.0,
      fontWeight: FontWeight.bold,
      color: textColor,
  );
  static const TextStyle bodyText1 = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: textColor,
  );

  // Spacing
  static const double smallSpacing = 4.0;
  static const double mediumSpacing = 8.0;
  static const double largeSpacing = 16.0;

  // Shadows
  static const List<BoxShadow> defaultShadow = [
    BoxShadow(
      color: Colors.black26,
      offset: Offset(0.0, 2.0),
      blurRadius: 8.0,
      spreadRadius: 1.0,
    ),
  ];
}