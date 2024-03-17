import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'display_start.dart';
import 'questions_screen.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String currentScreen = 'start-screen';
  List<String> selectedAnswer = [];
  void switchScreen() {
    setState(() {
      currentScreen = 'questions-screen';
    });
  }

  void onRestart() {
    setState(() {
      selectedAnswer = [];
      currentScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(
        () {
          currentScreen = 'results-screen';
        },
      );
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: currentScreen == 'start-screen'
            ? Start(switchScreen)
            : currentScreen == 'questions-screen'
                ? QuestionsScreen(chooseAnswer)
                : ResultsScreen(onRestart, selectedAnswer),
      ),
    );
  }
}
