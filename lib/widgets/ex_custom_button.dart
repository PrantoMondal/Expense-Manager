import 'package:expense_manager/constants/styles.dart';
import 'package:flutter/material.dart';

class ExButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ExButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: ExColor.buttonColorGreen,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: ExColor.buttonColorGreen.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: ExButton(
          text: 'Get Started',
          onPressed: () {
            print('Button Pressed!');
          },
        ),
      ),
    ),
  ));
}
