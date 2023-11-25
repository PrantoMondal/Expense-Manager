import 'package:expense_manager/constants/styles.dart';
import 'package:flutter/material.dart';

class ExAppBar extends StatelessWidget {
  final IconData? leading;
  final IconData? trailing;
  final String? title;
  final Function()? leadingOnTap;
  final Function()? trailingOnTap;
  final Color? color;
  const ExAppBar({
    super.key,
    this.leading,
    this.trailing,
    this.color,
    this.title,
    this.leadingOnTap,
    this.trailingOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: leadingOnTap,
            icon: Icon(
              leading,
              color: color,
            )),
        const Spacer(),
        Text(
          title!,
          style: ExTextStyle.title20W500.copyWith(color: color),
        ),
        const Spacer(),
        IconButton(
            onPressed: trailingOnTap,
            icon: Icon(
              trailing,
              color: color,
            )),
      ],
    );
  }
}
