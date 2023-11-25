import 'package:expense_manager/auth/login_page.dart';
import 'package:expense_manager/constants/styles.dart';
import 'package:expense_manager/utils/rich_text_with_on_tap.dart';
import 'package:expense_manager/widgets/app_bar.dart';
import 'package:expense_manager/widgets/ex_custom_button.dart';
import 'package:expense_manager/widgets/ex_text_field.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = '/registration';

  const RegistrationScreen({super.key});
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

bool isObscure = false;
bool isConfirmObscure = false;

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                    title: "Registration",
                  ),
                  Visibility(
                      visible: MediaQuery.of(context).viewInsets.bottom == 0
                          ? true
                          : false,
                      child: const SizedBox(height: 100.0)),
                  const SizedBox(height: 100.0),
                  ExTextField(
                    prefixIconData: FeatherIcons.user,
                    hintText: "Enter your name",
                    hintTextStyle: ExTextStyle.green15W500
                        .copyWith(color: const Color(0xFF549994), fontSize: 12),
                    labelText: "Name",
                    labelTextStyle: ExTextStyle.green15W500,
                  ),
                  const SizedBox(height: 20.0),
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
                    hintText: "Enter your password",
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
                  const SizedBox(height: 20.0),
                  ExTextField(
                    prefixIconData: FeatherIcons.lock,
                    suffixIconData: isConfirmObscure
                        ? FeatherIcons.eyeOff
                        : FeatherIcons.eye,
                    hintText: "Enter your password again",
                    hintTextStyle: ExTextStyle.green15W500
                        .copyWith(color: const Color(0xFF549994), fontSize: 12),
                    labelText: "Confirm Password",
                    labelTextStyle: ExTextStyle.green15W500,
                    suffixOnTap: () {
                      setState(() {
                        isConfirmObscure = !isConfirmObscure;
                      });
                      print("tap...");
                    },
                    isObscure: isConfirmObscure,
                  ),
                  const SizedBox(height: 32.0),
                  ExButton(
                    text: 'Register',
                    onPressed: () {
                      print("object");
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  richTextWithOnTap(
                      "Already have an account?",
                      " SignIn",
                      () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            LoginPage.routeName,
                            (route) => false,
                          )),
                ],
              ),
            ),
          )),
    );
  }
}
