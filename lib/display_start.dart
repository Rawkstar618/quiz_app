import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatelessWidget {
  const Start(this.toQuestions, {super.key});
  final void Function() toQuestions;
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 278,
              color: const Color.fromARGB(135, 255, 255, 255),
            ),
            Text(
              '\nLearn Flutter the fun way!',
              style: GoogleFonts.anekDevanagari(
                  color: const Color.fromARGB(255, 3, 62, 109),
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 60),
            OutlinedButton.icon(
              onPressed: toQuestions,
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(219, 42, 231, 187),
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 22, right: 17),
                textStyle: const TextStyle(fontSize: 17),
              ),
              icon: const Icon(
                Icons.arrow_right_alt,
                size: 30,
              ),
              label: const Text(
                ' Start Quiz    ',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
