import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 32,
      decoration: BoxDecoration(
        color: Color(0xFFf6d06b),
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Text(
        "Pizza",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          fontFamily: "Impact",
          color: Theme.of(context).primaryColor,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
