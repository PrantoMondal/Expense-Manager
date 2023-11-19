import 'package:expense_manager/utils/pie_chart.dart';
import 'package:flutter/material.dart';

class MonthlyChartPage extends StatelessWidget {
  MonthlyChartPage({super.key});
  final Map<String, double> monthlyExpenseData = {
    'Food': 200.0,
    'Transportation': 50.0,
    'Utilities': 100.0,
    'Others': 80.0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          'Expense Manager',
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextWithColor(
            title: "Food",
            color: Colors.red,
          ),
          const TextWithColor(
            title: "Transportation",
            color: Colors.pink,
          ),
          const TextWithColor(
            title: "Utilities",
            color: Colors.purple,
          ),
          const TextWithColor(
            title: "Others",
            color: Colors.deepPurple,
          ),
          MonthlyHistoryPieChart(expenseData: monthlyExpenseData),
          // Other widgets and information can be added here
        ],
      ),
    );
  }
}

class TextWithColor extends StatelessWidget {
  final String title;
  final Color color;
  const TextWithColor({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("$title"),
          SizedBox(
            width: 10,
          ),
          Container(
            color: color,
            height: 20,
            width: 20,
          )
        ],
      ),
    );
  }
}
