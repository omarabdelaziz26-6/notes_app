import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const CustomIconButton({super.key, required this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.05),
      ),
      child: Center(
        child: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            size: 28,
          ),
        ),
      ),
    );
  }
}
