import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey[200]!,
    primary: Colors.white,
    secondary: Colors.grey[300]!,
  ),
  useMaterial3: true,
);
