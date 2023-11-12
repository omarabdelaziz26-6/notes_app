import 'package:flutter/material.dart';
import 'package:tharwat_notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isLoading;

  const CustomButton({super.key, this.onPressed, this.isLoading = false});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: kPrimaryColor,
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          45,
        ),
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.black,
            )
          : const Text(
              "Add",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
    );
  }
}
