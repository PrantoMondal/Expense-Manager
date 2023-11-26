import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExColor {
  static const Color primaryColor = Color(0xFF63B5AF);
  static const Color secondaryColor = Color(0xFF6C757D);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color textColorWhite = Color(0xFFffffff);
  static const Color textColorGreen = Color(0xFF438883);
  static const Color black222222 = Color(0xFF222222);
  static const Color textColorWhite3 = Color(0xFF333333);
  static const Color textColorWhite4 = Color(0xFF333333);
  static const Color textColorWhite5 = Color(0xFF333333);
  static const Color textColorWhite6 = Color(0xFF333333);
  static const Color textColorWhite7 = Color(0xFF333333);
  static const Color textColorWhite8 = Color(0xFF333333);
  static const Color textColorWhite9 = Color(0xFF333333);
  static const Color textColorWhite10 = Color(0xFF333333);
  static const Color buttonColorGreen = Color(0xFF3E7C78);
}

class ExTextStyle {
  // Example text styles
  static TextStyle white24W700 = GoogleFonts.inter(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: ExColor.textColorWhite,
  );

  static TextStyle green36W700 = GoogleFonts.inter(
    fontSize: 36.0,
    fontWeight: FontWeight.w700,
    color: ExColor.textColorGreen,
  );

  static TextStyle green15W500 = GoogleFonts.inter(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    color: ExColor.textColorGreen,
  );

  static TextStyle title20W500 = GoogleFonts.inter(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
  );
  static TextStyle t16W500 = GoogleFonts.inter(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
}

class ExScreenSize {
  final BuildContext context;

  ExScreenSize(this.context);

  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
}
