import 'package:flutter/material.dart';

class CircleColorWidget extends StatelessWidget {
  final Color color;
  final bool isSelectedColor;

  const CircleColorWidget(
      {super.key, required this.color, required this.isSelectedColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: color,
      child: isSelectedColor
          ? const Icon(
              Icons.done_outline,
              color: Colors.black,
            )
          : null,
    );
  }
}
