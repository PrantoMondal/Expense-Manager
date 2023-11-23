import 'package:expense_manager/auth/login_page.dart';
import 'package:expense_manager/constants/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ExScreenSize screenSize = ExScreenSize(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              Image.asset(
                  width: screenSize.width,
                  height: screenSize.height * 0.67,
                  "assets/images/onBoarding.png"),
              Positioned(
                  bottom: 0,
                  child: Image.asset(
                      width: screenSize.width,
                      height: screenSize.height * 0.57,
                      "assets/images/onBoardingMan.png")),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Spend Smarter\nSave More",
            style: ExTextStyle.green36W700,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: screenSize.width * 0.8,
            height: screenSize.height * 0.07,
            decoration: BoxDecoration(
              color: ExColor.buttonColorGreen,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: ExColor.buttonColorGreen.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                print('Button Pressed!');
              },
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
          RichText(
            text: TextSpan(
              text: 'Already have an account? ',
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'Log In',
                  style: const TextStyle(
                    color: ExColor.buttonColorGreen,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle log in action
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
