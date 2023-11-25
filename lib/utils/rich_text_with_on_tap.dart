import 'package:expense_manager/constants/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

RichText richTextWithOnTap(
  String text1,
  String text2,
  Function() onTap,
) {
  return RichText(
    text: TextSpan(
      text: text1,
      style: ExTextStyle.green15W500.copyWith(
          fontWeight: FontWeight.w400, color: const Color(0xFF444444)),
      children: [
        TextSpan(
          text: text2,
          style: ExTextStyle.green15W500,
          recognizer: TapGestureRecognizer()..onTap = onTap,
        ),
      ],
    ),
  );
}
