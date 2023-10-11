import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }
}
