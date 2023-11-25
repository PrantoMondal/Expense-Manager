import 'package:expense_manager/auth/sign_up.dart';
import 'package:expense_manager/constants/styles.dart';
import 'package:expense_manager/pages/bottom_nav.dart';
import 'package:expense_manager/pages/dashboard_page.dart';
import 'package:expense_manager/utils/rich_text_with_on_tap.dart';
import 'package:expense_manager/widgets/app_bar.dart';
import 'package:expense_manager/widgets/ex_custom_button.dart';
import 'package:expense_manager/widgets/ex_text_field.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool isObscure = false;

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pageHeader.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60.0),
                const ExAppBar(
                  color: Colors.white,
                  title: "Login",
                ),
                const SizedBox(height: 200.0),
                ExTextField(
                  prefixIconData: FeatherIcons.mail,
                  hintText: "Enter your email",
                  hintTextStyle: ExTextStyle.green15W500
                      .copyWith(color: const Color(0xFF549994), fontSize: 12),
                  labelText: "Email",
                  labelTextStyle: ExTextStyle.green15W500,
                ),
                const SizedBox(height: 20.0),
                ExTextField(
                  prefixIconData: FeatherIcons.lock,
                  suffixIconData:
                      isObscure ? FeatherIcons.eyeOff : FeatherIcons.eye,
                  hintText: "Enter your Password",
                  hintTextStyle: ExTextStyle.green15W500
                      .copyWith(color: const Color(0xFF549994), fontSize: 12),
                  labelText: "Password",
                  labelTextStyle: ExTextStyle.green15W500,
                  suffixOnTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                    print("tap...");
                  },
                  isObscure: isObscure,
                ),
                const SizedBox(height: 32.0),
                ExButton(
                  text: 'Login',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      ExBottomAppBar.routeName,
                      (route) => false,
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                richTextWithOnTap(
                  "Don't have an account?",
                  " Register",
                  () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    RegistrationScreen.routeName,
                    (route) => false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
