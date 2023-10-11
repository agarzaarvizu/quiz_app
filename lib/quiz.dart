import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

import 'package:quiz_app/elements/gradient_container.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
  });

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // We initialize the activeScreen variable with an identifier insted of saving the full widget in the variable
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      // And change to 'questions-screen' when executing the switchScreen function
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void returnHome() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(startQuiz: switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        action: returnHome,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(
          gradientColors: const [
            Color.fromARGB(255, 255, 68, 130),
            Color.fromARGB(255, 255, 83, 64),
          ],
          content: screenWidget,
        ),
      ),
    );
  }
}

// You can use ternary expresions to create conditions, this are set as:
// Condition ? If matches ? If not
// activeScreen == 'start-screen' ? StartScreen() : QuestionsScreen()
// You can also do that with simple if statements
// but sometimes ternary operators are simplier for if-else conditions
//
// You can use if statements for adding elements into a list, ex.
// final myList = [1, 2, if (condition) 3]
// final myList = [1, 2, if (condition) 3 else 4]
// final myList = [1, 2, condition ? 3 : 4]
// This can help to add elements into Row() or Column() widgets