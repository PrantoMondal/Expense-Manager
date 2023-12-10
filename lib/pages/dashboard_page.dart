import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/auth/auth_service.dart';
import 'package:expense_manager/auth/login_page.dart';
import 'package:expense_manager/constants/styles.dart';
import 'package:expense_manager/db/db_helper.dart';
import 'package:expense_manager/models/user_model.dart';
import 'package:expense_manager/providers/user_provider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isLoading = false;

  String currentUserUid = FirebaseAuth.instance.currentUser!.uid;
  String? docId;
  UserModel? userData;

  Future<void> getCurrentUserDocId() async {
    print(currentUserUid);

    try {
      userData = await DbHelper().getUserDetails(currentUserUid);
      print("User Data: ${userData!.name}");
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  fetchData() async {
    setState(() {
      isLoading = true;
    });

    await getCurrentUserDocId();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Afternoon,',
                              style: ExTextStyle.title20W500.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              userData!.name,
                              style: ExTextStyle.title20W500
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white30),
                          child: GestureDetector(
                            onTap: () {
                              EasyLoading.show(status: 'Please wait');
                              AuthService.logout();
                              Navigator.pushNamedAndRemoveUntil(context,
                                  LoginPage.routeName, (route) => false);
                              EasyLoading.dismiss();
                            },
                            child: const Stack(
                              children: [
                                Icon(
                                  Icons.notifications_none,
                                  color: Colors.white,
                                ),
                                Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Color(0xFFFFAB7B),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 210,
                      decoration: BoxDecoration(
                          color: const Color(0xFF1B5C58),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Balance",
                                style: ExTextStyle.t16W500.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "\$ 2,548.00",
                                style: ExTextStyle.white24W700.copyWith(
                                    color: Colors.white, fontSize: 30),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.white30,
                                    child: Icon(
                                      FeatherIcons.arrowDown,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Income",
                                    style: ExTextStyle.t16W500.copyWith(
                                        color: const Color(0xFFD0E5E4)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "\$ 1,840.00",
                                style: ExTextStyle.title20W500.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.more_horiz,
                                color: Colors.white,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.white30,
                                    child: Icon(
                                      FeatherIcons.arrowUp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Expenses",
                                    style: ExTextStyle.t16W500.copyWith(
                                        color: const Color(0xFFD0E5E4)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "\$ 284.00",
                                style: ExTextStyle.title20W500.copyWith(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transactions history",
                          style: ExTextStyle.title20W500
                              .copyWith(color: const Color(0xFF222222)),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all",
                              style: ExTextStyle.t16W500
                                  .copyWith(color: const Color(0xFF666666)),
                            ))
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: const Text("Test title"),
                            subtitle: const Text("Aug 23,2023"),
                            trailing: Text(
                              '\$50.90',
                              style: ExTextStyle.title20W500
                                  .copyWith(color: ExColor.primaryColor),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
