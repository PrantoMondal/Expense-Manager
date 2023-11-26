import 'package:expense_manager/constants/styles.dart';
import 'package:expense_manager/widgets/app_bar.dart';
import 'package:expense_manager/widgets/ex_custom_button.dart';
import 'package:expense_manager/widgets/ex_text_field.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  static const String routeName = "/addExpense";
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
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
        // You can do something with the selected date, like updating a text field.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                title: "Add Expense",
                color: Colors.white,
                trailing: FeatherIcons.moreHorizontal,
                trailingOnTap: () {},
                leading: Icons.arrow_back_ios,
                leadingOnTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Text(
                        "PURPOSE",
                        style: ExTextStyle.t16W500.copyWith(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ExTextField(
                        // textEditingController: phoneController,
                        keyboardType: TextInputType.name,
                        prefixIconData: FeatherIcons.codesandbox,
                        hintText: "Enter purpose",
                        hintTextStyle: ExTextStyle.green15W500.copyWith(
                            color: const Color(0xFF549994), fontSize: 12),
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
                        // textEditingController: phoneController,
                        keyboardType: TextInputType.number,
                        prefixIconData: FeatherIcons.dollarSign,
                        hintText: "Enter amount",
                        hintTextStyle: ExTextStyle.green15W500.copyWith(
                            color: const Color(0xFF549994), fontSize: 12),
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
                        // textEditingController: phoneController,
                        keyboardType: TextInputType.number,
                        suffixIconData: FeatherIcons.calendar,
                        suffixOnTap: () {
                          _selectDate(context);
                        },
                        hintText: "Select date",
                        hintTextStyle: ExTextStyle.green15W500.copyWith(
                            color: const Color(0xFF549994), fontSize: 12),
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
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ExButton(text: 'Save', onPressed: () {}),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
