import 'package:expense_manager/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final String? initialValue;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? labelText;
  final TextStyle? labelTextStyle;
  final String? helperText;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final IconData? iconData;
  final IconData? prefixIconData;
  final Color? prefixIconColor;
  final IconData? suffixIconData;
  final Function()? suffixOnTap;
  final String? Function(String?)? validator;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final bool number;
  final bool? editable;
  final bool isObscure;
  final int maxLines;

  const ExTextField({
    Key? key,
    this.textEditingController,
    this.focusNode,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.labelText,
    this.labelTextStyle,
    this.helperText,
    this.iconData,
    this.prefixIconData,
    this.prefixIconColor,
    this.suffixIconData,
    this.suffixOnTap,
    this.hintText,
    this.hintTextStyle,
    this.validator,
    this.suffixIconColor,
    this.keyboardType,
    this.isObscure = false,
    this.number = false,
    this.onTap,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.editable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      initialValue: initialValue,
      textInputAction: TextInputAction.done,
      controller: textEditingController,
      focusNode: focusNode,
      obscureText: isObscure,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
      enabled: editable,
      style: ExTextStyle.green15W500,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF438883)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF438883)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF438883)),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        icon: iconData != null ? Icon(iconData) : null,
        labelText: labelText,
        labelStyle: labelTextStyle ?? ExTextStyle.green36W700,
        isDense: true,
        helperText: helperText,
        hintText: hintText,
        hintStyle: hintTextStyle,
        prefixIcon: prefixIconData != null
            ? Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 10.0),
                child: Icon(
                  prefixIconData,
                  color: prefixIconColor ?? const Color(0xFF438883),
                  size: 23,
                ),
              )
            : null,
        suffixIcon: suffixIconData != null
            ? GestureDetector(
                onTap: suffixOnTap,
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Icon(
                    suffixIconData,
                    color: Color(0xFF438883),
                    size: 20,
                  ),
                ),
              )
            : null,
      ),
      validator: validator,
    );
  }
}
