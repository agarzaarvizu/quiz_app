class QuizQuestion {
  QuizQuestion({required this.text, required this.answers});

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

// You can create simple classes in order to reuse them and create the objects
