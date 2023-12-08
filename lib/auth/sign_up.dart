import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/auth/auth_service.dart';
import 'package:expense_manager/auth/login_page.dart';
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

class RegistrationScreen extends StatefulWidget {
  static const String routeName = '/registration';

  const RegistrationScreen({super.key});
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

bool isObscure = true;
bool isConfirmObscure = true;

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String errMsg = '';

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60.0),
                const ExAppBar(
                  color: Colors.white,
                  title: "Registration",
                ),
                const SizedBox(height: 190.0),
                Expanded(
                  child: Form(
                    key: formkey,
                    child: ListView(
                      padding: const EdgeInsets.only(top: 5),
                      children: [
                        ExTextField(
                          textEditingController: nameController,
                          prefixIconData: FeatherIcons.user,
                          hintText: "Enter your name",
                          hintTextStyle: ExTextStyle.green15W500.copyWith(
                              color: const Color(0xFF549994), fontSize: 12),
                          labelText: "Name",
                          labelTextStyle: ExTextStyle.green15W500,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        ExTextField(
                          textEditingController: emailController,
                          keyboardType: TextInputType.emailAddress,
                          prefixIconData: FeatherIcons.mail,
                          hintText: "Enter your email",
                          hintTextStyle: ExTextStyle.green15W500.copyWith(
                              color: const Color(0xFF549994), fontSize: 12),
                          labelText: "Email",
                          labelTextStyle: ExTextStyle.green15W500,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        ExTextField(
                          textEditingController: phoneController,
                          keyboardType: TextInputType.phone,
                          prefixIconData: FeatherIcons.phoneCall,
                          hintText: "Enter your phone number",
                          hintTextStyle: ExTextStyle.green15W500.copyWith(
                              color: const Color(0xFF549994), fontSize: 12),
                          labelText: "Phone",
                          labelTextStyle: ExTextStyle.green15W500,
                        ),
                        const SizedBox(height: 20.0),
                        ExTextField(
                          textEditingController: passController,
                          prefixIconData: FeatherIcons.lock,
                          suffixIconData: isObscure
                              ? FeatherIcons.eyeOff
                              : FeatherIcons.eye,
                          hintText: "Enter your password",
                          hintTextStyle: ExTextStyle.green15W500.copyWith(
                              color: const Color(0xFF549994), fontSize: 12),
                          labelText: "Password",
                          labelTextStyle: ExTextStyle.green15W500,
                          suffixOnTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          isObscure: isObscure,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (!RegExp(
                                    r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$')
                                .hasMatch(value)) {
                              return 'Please enter a strong password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        ExTextField(
                          textEditingController: confirmPassController,
                          prefixIconData: FeatherIcons.lock,
                          suffixIconData: isConfirmObscure
                              ? FeatherIcons.eyeOff
                              : FeatherIcons.eye,
                          hintText: "Enter your password again",
                          hintTextStyle: ExTextStyle.green15W500.copyWith(
                              color: const Color(0xFF549994), fontSize: 12),
                          labelText: "Confirm Password",
                          labelTextStyle: ExTextStyle.green15W500,
                          suffixOnTap: () {
                            setState(() {
                              isConfirmObscure = !isConfirmObscure;
                            });
                          },
                          isObscure: isConfirmObscure,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Re-type password';
                            } else if (value != passController.text) {
                              return 'Password doesn\'t match';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 32.0),
                        Center(
                          child: ExButton(
                            text: 'Register',
                            onPressed: () {
                              authenticate();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: richTextWithOnTap(
                              "Already have an account?",
                              " SignIn",
                              () => Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    LoginPage.routeName,
                                    (route) => false,
                                  )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  authenticate() async {
    EasyLoading.show(status: 'Please wait', dismissOnTap: false);
    if (formkey.currentState!.validate()) {
      try {
        if (await AuthService.register(
            emailController.text, confirmPassController.text)) {
          final userModel = UserModel(
              uid: AuthService.user!.uid,
              name: nameController.text,
              email: AuthService.user!.email!,
              mobile: phoneController.text,
              userCreationTime:
                  Timestamp.fromDate(AuthService.user!.metadata.creationTime!),
              image: '',
              deviceToken: '');
          if (!mounted) return;
          Provider.of<UserProvider>(context, listen: false)
              .adduser(userModel)
              .then((value) {
            EasyLoading.dismiss();
            Navigator.pushNamedAndRemoveUntil(
                context, SplashScreen.routeName, (route) => false);
          });
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          errMsg = e.toString();
        });
      }
    }
  }
}
