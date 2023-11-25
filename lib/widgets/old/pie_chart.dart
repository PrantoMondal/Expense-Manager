import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MonthlyHistoryPieChart extends StatelessWidget {
  final Map<String, double>
      expenseData; // Map of expense types and their amounts

  MonthlyHistoryPieChart({required this.expenseData});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          sections: getSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> getSections() {
    List<PieChartSectionData> sections = [];

    int index = 0;
    expenseData.forEach((type, amount) {
      final double fontSize = 16;
      final double radius = 60;
      sections.add(
        PieChartSectionData(
          color: Colors.primaries[index % Colors.primaries.length],
          value: amount,
          title: '$amount',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        ),
      );
      index++;
    });

    return sections;
  }
}
