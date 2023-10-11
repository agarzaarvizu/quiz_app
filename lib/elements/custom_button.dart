import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.action,
  });

  final String buttonText;
  final void Function() action;

  @override
  Widget build(context) {
    return OutlinedButton.icon(
      onPressed: action,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(
          Color.fromARGB(255, 35, 35, 35),
        ),
      ),
      label: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
      ),
      icon: const Icon(
        Icons.arrow_right_alt,
        color: Colors.white,
      ),
    );
  }
}
