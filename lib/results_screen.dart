import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/elements/styled_text.dart';
import 'package:quiz_app/elements/answer_button.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.action,
  });

  final List<String> chosenAnswers;
  final void Function() action;

  List<Map<String, Object>> get summaryData {
    // If you have a function that uses no variables, you can defined as a getter
    // by adding the get prefix and removing the parenthesis, so that will create
    // directly a variable with the result instead of you creating a variable to
    // catch the return, ex. var summaryData = getSummaryData;
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length; // This is an arrow function, you can use them where the code
    // inmediatly returns a value, so instead of making this function:
    // function() {
    //  return value;
    // }
    // You do this instead:
    // function() => value;

    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StyledText(
            text:
                'You answered $numCorrectQuestions out of $numTotalQuestions questons correctly!',
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(
            summaryData: summaryData,
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(
            action: action,
            answerText: 'Restart Quiz!',
          ),
        ],
      ),
    );
  }
}

// The type of data 'map' is the same as dict in python
// For a for loop, it can be managed in two ways:
// for (var i = 0; condition; i++)
// or
// for (final value in values)
