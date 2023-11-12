import 'package:flutter/material.dart';

class EmptyListBody extends StatelessWidget {
  const EmptyListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No Notes yet",
        style: TextStyle(
          fontFamily: "poppines",
          color: Colors.white,
          fontSize: 28,
        ),
      ),
    );
  }
}
