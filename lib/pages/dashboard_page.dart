import 'package:expense_manager/utils/add_expense_dialog.dart';
import 'package:flutter/material.dart';

import 'monthlyChart_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Assuming you have a Provider for managing the state
    //var expenseProvider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      appBar: AppBar(
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
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          'ExpendiGo',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => MonthlyChartPage()));
              },
              icon: Icon(
                Icons.bar_chart,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Expenses:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$500',
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
            SizedBox(height: 20),
            Text(
              'Recent Expenses:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  // var expense = expenseProvider.recentExpenses[index];
                  return ListTile(
                    title: Text("expense.title"),
                    subtitle: Text('\${expense.amount.toStringAsFixed(2)}'),
                    trailing: Text("expense.date"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddExpenseDialog();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
