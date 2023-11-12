import 'package:flutter/material.dart';
import 'package:tharwat_notes_app/constants.dart';
import 'package:tharwat_notes_app/helpers/custom_border.dart';
import 'package:tharwat_notes_app/helpers/keyboard_type_function.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final int maxLines;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.labelText,
    this.maxLines = 1,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is Required";
        } else {
          return null;
        }
      },
      keyboardType: keyboardTypeFunction(labelText: labelText),
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        enabledBorder: customBorder(borderColor: Colors.white),
        focusedBorder: customBorder(borderColor: kPrimaryColor),
        errorBorder: customBorder(borderColor: Colors.red),
        focusedErrorBorder: customBorder(borderColor: Colors.red),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
