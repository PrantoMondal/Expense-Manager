import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/auth/auth_service.dart';
import 'package:expense_manager/auth/sign_up.dart';
import 'package:expense_manager/constants/styles.dart';
import 'package:expense_manager/models/user_model.dart';

import 'package:expense_manager/pages/splash_screen.dart';
import 'package:expense_manager/providers/user_provider.dart';
import 'package:expense_manager/utils/rich_text_with_on_tap.dart';
import 'package:expense_manager/widgets/app_bar.dart';
import 'package:expense_manager/widgets/ex_custom_button.dart';
import 'package:expense_manager/widgets/ex_text_field.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool isObscure = true;

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errMsg = '';

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
          child: Form(
            key: formKey,
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
                    textEditingController: emailController,
                    prefixIconData: FeatherIcons.mail,
                    hintText: "Enter your email",
                    hintTextStyle: ExTextStyle.green15W500
                        .copyWith(color: const Color(0xFF549994), fontSize: 12),
                    labelText: "Email",
                    labelTextStyle: ExTextStyle.green15W500,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ExTextField(
                    textEditingController: passController,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32.0),
                  ExButton(
                    text: 'Login',
                    onPressed: () {
                      authenticate();
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
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          AuthService.signInWithGoogle()
                              .then((credential) async {
                            if (credential.user != null) {
                              if (!await Provider.of<UserProvider>(context,
                                      listen: false)
                                  .doesUserExist(credential.user!.uid)) {
                                final userModel = UserModel(
                                  uid: credential.user!.uid,
                                  name: credential.user!.displayName!,
                                  email: credential.user!.email!,
                                  userCreationTime: Timestamp.fromDate(
                                      credential.user!.metadata.creationTime!),
                                );
                                await Provider.of<UserProvider>(context,
                                        listen: false)
                                    .adduser(userModel);
                              }
                              Navigator.pushReplacementNamed(
                                  context, SplashScreen.routeName);
                            }
                          });
                        },
                        child: Image.asset(
                            height: 50, width: 50, "assets/images/google.png"),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                            height: 32,
                            width: 32,
                            "assets/images/facebook.png"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    errMsg,
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  authenticate() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait', dismissOnTap: false);
      try {
        final status =
            await AuthService.login(emailController.text, passController.text);
        if (status) {
          if (!mounted) return;

          Navigator.pushReplacementNamed(context, SplashScreen.routeName);
        } else {
          await AuthService.logout();
          setState(() {
            errMsg = 'This email does not belong to an Admin account';
          });
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          errMsg = e.message!;
        });
      }
      EasyLoading.dismiss();
    }
  }
}
