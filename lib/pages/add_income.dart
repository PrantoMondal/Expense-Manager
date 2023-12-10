import 'package:expense_manager/constants/styles.dart';
import 'package:expense_manager/widgets/app_bar.dart';
import 'package:expense_manager/widgets/ex_custom_button.dart';
import 'package:expense_manager/widgets/ex_text_field.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class AddIncomeScreen extends StatefulWidget {
  // static const String routeName = "/addIncome";
  const AddIncomeScreen({super.key});

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 20, bottom: 100),
              children: [
                Text(
                  "SOURCE",
                  style: ExTextStyle.t16W500.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                ExTextField(
                  // textEditingController: sourceController,
                  keyboardType: TextInputType.name,
                  prefixIconData: FeatherIcons.creditCard,
                  hintText: "Enter source",
                  hintTextStyle: ExTextStyle.green15W500
                      .copyWith(color: const Color(0xFF549994), fontSize: 12),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "AMOUNT",
                  style: ExTextStyle.t16W500.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                ExTextField(
                  // textEditingController: amountController,
                  keyboardType: TextInputType.number,
                  prefixIconData: FeatherIcons.dollarSign,
                  hintText: "Enter amount",
                  hintTextStyle: ExTextStyle.green15W500
                      .copyWith(color: const Color(0xFF549994), fontSize: 12),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "DATE",
                  style: ExTextStyle.t16W500.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                ExTextField(
                  // textEditingController: dateController,
                  keyboardType: TextInputType.number,
                  suffixIconData: FeatherIcons.calendar,
                  suffixOnTap: () {
                    _selectDate(context);
                  },
                  hintText: "Select date",
                  hintTextStyle: ExTextStyle.green15W500
                      .copyWith(color: const Color(0xFF549994), fontSize: 12),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "INVOICE",
                  style: ExTextStyle.t16W500.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_circle_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Add invoice",
                        style: ExTextStyle.t16W500.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ExButton(text: 'Save', onPressed: () {}),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
