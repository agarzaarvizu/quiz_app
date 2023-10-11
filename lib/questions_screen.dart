import 'package:flutter/material.dart';

import 'package:quiz_app/elements/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer); // widget calls the inherited state widget
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.shuffledAnswers.map(
            (answer) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                child: AnswerButton(
                  answerText: answer,
                  action: () {
                    // answerQuestion asks for a void return, so we create an anonymous function
                    // in order to just call the function, append the value and execute the state
                    answerQuestion(answer);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
// The map functions does not changes the list, yields a new list
// The shuffle function changes the list
// You can spred a list ( extract each item of a list and spred them ) using 
// three dots as prefix of the list
