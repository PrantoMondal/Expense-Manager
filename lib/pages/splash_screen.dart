import 'dart:async';

import 'package:expense_manager/auth/login_page.dart';
import 'package:expense_manager/constants/styles.dart';
import 'package:expense_manager/pages/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a long-running task to show the splash screen for a few seconds.
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ExColor.primaryColor,
      body: Stack(
        children: [
          Image.asset("assets/images/splashBG.png"),
          Positioned.fill(
            child: Center(
              child: Text(
                "ExpendiGo",
                style: ExTextStyle.white24W700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
