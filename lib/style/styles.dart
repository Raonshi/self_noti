import 'package:flutter/material.dart';

ButtonStyle get mainButtonStyleForm => ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      backgroundColor: Colors.black,
    );

TextStyle get buttonTextStyle => const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

TextStyle get labelStyle => const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    );

TextStyle get titleSmallStyle => const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    );


TextStyle get guideTextStyle => TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
  color: Colors.grey.shade400,
);

ThemeData get lightTheme => ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.black,
        onPrimary: Colors.white,
        secondary: Colors.lightGreen.shade400,
        onSecondary: Colors.black,
        error: Colors.red.shade300,
        onError: Colors.white,
        background: Colors.grey.shade200,
        onBackground: Colors.black,
        surface: Colors.grey.shade300,
        onSurface: Colors.black,
        primaryContainer: Colors.grey.shade50,
        onPrimaryContainer: Colors.black,
        secondaryContainer: Colors.grey.shade100,
        onSecondaryContainer: Colors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade700,
      ),
    );
