import 'package:expense_manager/auth/auth_service.dart';
import 'package:expense_manager/auth/login_page.dart';
import 'package:expense_manager/constants/styles.dart';
import 'package:expense_manager/pages/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import 'bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      if (AuthService.user == null) {
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      } else {
        Navigator.pushReplacementNamed(context, ExBottomAppBar.routeName);
      }
    });
    super.initState();
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
