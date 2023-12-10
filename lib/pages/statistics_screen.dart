import 'package:expense_manager/constants/styles.dart';
import 'package:expense_manager/widgets/app_bar.dart';
import 'package:expense_manager/widgets/tab_bar.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  static const String routeName = '/statistics';
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  TabWidget? selectedItem;
  List<TabWidget> tabWidget = [
    TabWidget(tabTitle: "Day", tabWidget: const Text("day")),
    TabWidget(tabTitle: "Week", tabWidget: const Text("week")),
    TabWidget(tabTitle: "Month", tabWidget: const Text("month")),
    TabWidget(tabTitle: "Year", tabWidget: const Text("year")),
  ];
  @override
  void initState() {
    selectedItem = tabWidget.first;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            ExAppBar(
              title: "Statistics",
              color: const Color(0xFF222222),
              trailing: FeatherIcons.download,
              trailingOnTap: () {},
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
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                color: selectedItem == tab
                                    ? ExColor.textColorGreen
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
                                  style: TextStyle(
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
            Container(
              height: 300,
              color: Colors.white,
              child: Center(
                child: selectedItem?.tabWidget,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Spending",
                  style: ExTextStyle.title20W500
                      .copyWith(color: ExColor.black222222),
                ),
                const Icon(Icons.arrow_upward_outlined)
              ],
            ),
            const SizedBox(
              height: 10,
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
            )
          ],
        ),
      ),
    );
  }
}
