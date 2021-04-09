import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urban_outlets/themes/color_theme.dart';
import 'package:urban_outlets/themes/text_theme.dart';
import 'package:urban_outlets/utils/dimens.dart';

class UnderLineTextField extends TextFormField {
  final bool isReadOnly;
  final bool isDisable;
  final TextEditingController controller;
  final String label;
  final String hint;
  final double fontSize;
  final Widget sufficIcon;
  final TextInputType keyboardType;
  final Function(String) onEnterTrigger;
  final String errorText;
  final bool isPassword;
  final List<TextInputFormatter> formatter;
  final Function() onTap;

  UnderLineTextField({
    Key key,
    this.isReadOnly = false,
    this.isDisable = false,
    this.controller,
    this.label,
    this.hint,
    this.fontSize = fontBase,
    this.sufficIcon,
    this.keyboardType = TextInputType.text,
    this.onEnterTrigger,
    this.errorText,
    this.isPassword = false,
    this.formatter,
    this.onTap,
  }) : super(
            key: key,
            controller: controller,
            keyboardType: keyboardType,
            textInputAction: onEnterTrigger != null ? TextInputAction.go : null,
            obscureText: isPassword,
            onFieldSubmitted: (value) {
              if (onEnterTrigger != null) {
                onEnterTrigger(value);
              }
            },
            readOnly: isReadOnly,
            decoration: InputDecoration(
              enabled: !isDisable,
              labelText: label,
              labelStyle: semiBold.copyWith(fontSize: fontSize),
              hintText: hint,
              hintStyle: semiBold.copyWith(fontSize: fontSize),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor)),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey)),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              suffixIcon: sufficIcon,
              suffixIconConstraints: BoxConstraints(
                maxWidth: 24,
                maxHeight: 24,
                minHeight: 24,
                minWidth: 24,
              ),
              errorText: errorText,
              errorStyle:
                  semiBold.copyWith(fontSize: fontSize, color: Colors.red),
            ),
            inputFormatters: formatter,
            onTap: onTap);
}
