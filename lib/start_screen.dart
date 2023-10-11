import 'package:flutter/material.dart';

import 'package:quiz_app/elements/styled_text.dart';
import 'package:quiz_app/elements/custom_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.startQuiz,
  });

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Image(
          image: AssetImage('assets/images/quiz-logo.png'),
          width: 250,
          color: Color.fromARGB(193, 255, 255, 255),
        ),
        const SizedBox(
          height: 50,
        ),
        const StyledText(
          text: 'Learn Flutter the fun way!',
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          buttonText: 'Start Quiz',
          action: startQuiz,
        ),
      ],
    );
  }
}
