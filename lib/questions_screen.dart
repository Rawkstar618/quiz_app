import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/models/ans_bp.dart';
import 'data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currQueInd = 0;
  void changeQues(String answer) {
    widget.onSelectAnswer(answer);
    setState(
      () {
        currQueInd++;
      },
    );
  }

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 30, 220, 87),
            Color.fromARGB(255, 22, 240, 240)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                textAlign: TextAlign.center,
                questions[currQueInd].question,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 3, 62, 109),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              ...questions[currQueInd].shuffleAns().map(
                (answer) {
                  return AnsBP(
                    answer,
                    () {
                      changeQues(answer);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
