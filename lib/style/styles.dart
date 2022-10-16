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
