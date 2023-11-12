import 'package:flutter/material.dart';

OutlineInputBorder customBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide(
        color: borderColor,
      ),
    );
  }
