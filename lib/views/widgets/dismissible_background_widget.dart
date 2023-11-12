import 'package:flutter/material.dart';

class DismissibleBackground extends StatelessWidget {
  final Color color;
  final IconData icon;

  const DismissibleBackground(
      {super.key, required this.color, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: Colors.black,
          size: 50,
        ),
      ),
    );
  }
}
