import 'package:flutter/material.dart';

class BaseTextField extends TextField {
  BaseTextField({
    super.onTap,
    super.readOnly,
    super.key,
    String? hintText,
    super.keyboardType,
    super.onChanged,
    super.inputFormatters,
    super.textAlign = TextAlign.start,
    TextStyle? hintStyle,
    String? errorText,
    TextStyle? errorTextStyle,
    super.minLines,
    super.maxLines,
    super.style,
  }) : super(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            errorText: errorText,
            errorStyle: errorTextStyle,
          ),
        );
}
