import 'package:expense_manager/constants/styles.dart';
import 'package:expense_manager/pages/add_expense.dart';
import 'package:expense_manager/pages/add_income.dart';
import 'package:expense_manager/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:expense_manager/widgets/app_bar.dart';

class AddTransactionScreen extends StatefulWidget {
  static const String routeName = "/addTransaction";
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  DateTime? selectedDate;

  TabWidget? selectedItem;
  List<TabWidget> tabWidget = [
    TabWidget(tabTitle: "Expense", tabWidget: AddExpenseScreen()),
    TabWidget(tabTitle: "Income", tabWidget: AddIncomeScreen()),
  ];
  @override
  void initState() {
    selectedItem = tabWidget.first;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
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
              children: [
                const SizedBox(
                  height: 60,
                ),
                ExAppBar(
                  title: "Add Transaction",
                  color: Colors.white,
                  trailing: FeatherIcons.moreHorizontal,
                  trailingOnTap: () {},
                  leading: Icons.arrow_back_ios,
                  leadingOnTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    for (TabWidget tab in tabWidget)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedItem = tab;
                            });
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: selectedItem == tab
                                        ? Colors.green
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 2),
                                  child: Center(
                                    child: Text(
                                      tab.tabTitle,
                                      style: ExTextStyle.t16W500.copyWith(
                                        color: selectedItem == tab
                                            ? Colors.white
                                            : const Color(0xFF466087),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 550,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: selectedItem?.tabWidget,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
