import 'summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/questions.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() onRestart;
  const ResultsScreen(this.onRestart, this.chosenAnswers, {super.key});
  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < questions.length; i++) {
      summary.add(
        {
          'Question Index': i,
          'Question': questions[i].question,
          'Chosen Answer': chosenAnswers[i],
          'Correct Answer': questions[i].answers[0]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummary();
    final int correct = summaryData
            .where((data) {
              return data['Chosen Answer'] == data['Correct Answer'];
            })
            .toList()
            .length,
        total = questions.length;
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
                'You answered $correct out of $total questions correctly!',
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 3, 62, 109),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Summary(summaryData),
              const SizedBox(height: 50),
              TextButton.icon(
                  onPressed: onRestart,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  icon: const Icon(Icons.restart_alt),
                  label: const Text(
                    'Restart Quiz',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
