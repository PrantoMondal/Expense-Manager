import 'package:flutter/material.dart';

class AddExpenseDialog extends StatefulWidget {
  @override
  _AddExpenseDialogState createState() => _AddExpenseDialogState();
}

class _AddExpenseDialogState extends State<AddExpenseDialog> {
  // Controllers for text fields
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController purposeController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  // Dropdown value and options
  String selectedType = 'Food';
  List<String> expenseTypes = ['Food', 'Transportation', 'Utilities', 'Others'];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Expense',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount (\$)'),
              ),
              TextField(
                controller: purposeController,
                decoration: InputDecoration(labelText: 'Purpose'),
              ),
              TextField(
                controller: commentController,
                decoration: InputDecoration(labelText: 'Comment'),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField(
                value: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value.toString();
                  });
                },
                items: expenseTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Type'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add your logic to save the expense here
                  // You can use the values from the controllers and selectedType
                  Navigator.pop(context);
                },
                child: Text('Save Expense'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
