import 'package:expense_manager/pages/dashboard_page.dart';
import 'package:expense_manager/pages/profile.dart';
import 'package:expense_manager/pages/statistics_screen.dart';
import 'package:expense_manager/pages/wallet_screen.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'add_expense.dart';

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
    WalletScreen(),
    ProfileScreen(),
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
          Navigator.pushNamed(context, AddExpenseScreen.routeName);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
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
