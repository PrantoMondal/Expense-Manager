import 'package:expense_manager/auth/login_page.dart';
import 'package:expense_manager/auth/sign_up.dart';
import 'package:expense_manager/constants/styles.dart';
import 'package:expense_manager/pages/dashboard_page.dart';
import 'package:expense_manager/pages/statistics_screen.dart';
import 'package:expense_manager/widgets/old/add_expense_dialog.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class ExBottomAppBar extends StatefulWidget {
  static const String routeName = '/bottomAppbar';
  const ExBottomAppBar({super.key});

  @override
  State<ExBottomAppBar> createState() => _ExBottomAppBarState();
}

class _ExBottomAppBarState extends State<ExBottomAppBar> {
  int _selectedIndex = 0;
  int pageIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pages = [
    DashboardScreen(),
    StatisticsScreen(),
    DashboardScreen(),
    RegistrationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1F615C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddExpenseDialog();
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 60,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home_filled,
                      color: Color(0xFF549994),
                    )
                  : const Icon(
                      Icons.home_outlined,
                      color: Colors.grey,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                      FeatherIcons.barChart2,
                      color: Color(0xFF549994),
                    )
                  : const Icon(
                      FeatherIcons.barChart2,
                      color: Colors.grey,
                    ),
            ),
            const SizedBox(
              width: 60,
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                      Icons.wallet,
                      color: Color(0xFF549994),
                    )
                  : const Icon(
                      Icons.wallet,
                      color: Colors.grey,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? const Icon(
                      Icons.person,
                      color: Color(0xFF549994),
                    )
                  : const Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
