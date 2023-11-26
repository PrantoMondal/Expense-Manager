import 'package:expense_manager/auth/login_page.dart';
import 'package:expense_manager/constants/styles.dart';
import 'package:expense_manager/utils/rich_text_with_on_tap.dart';
import 'package:expense_manager/widgets/ex_custom_button.dart';
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
                  fit: BoxFit.fill,
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
          ExButton(
              text: 'Get Started',
              onPressed: () {
                print("object");
              }),
          const Spacer(),
          richTextWithOnTap(
            "Already have an account?",
            " Log In",
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
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
