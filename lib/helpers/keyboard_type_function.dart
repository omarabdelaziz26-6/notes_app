import 'package:flutter/material.dart';

TextInputType keyboardTypeFunction({required String labelText}) {
    
    return labelText == "Title" ? TextInputType.text : TextInputType.multiline;
  }