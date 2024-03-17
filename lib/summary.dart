import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  const Summary(this.summary, {super.key});
  final List<Map<String, Object>> summary;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: summary.map(
              (data) {
                Color clr = data['Chosen Answer'] == data['Correct Answer']
                    ? const Color.fromARGB(255, 164, 255, 54)
                    : const Color.fromARGB(255, 234, 27, 13);
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        selectionColor: const Color.fromARGB(255, 3, 62, 109),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 3, 62, 109),
                            fontSize: 38),
                        '${(data['Question Index'] as int) + 1}  '),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              style: GoogleFonts.lato(
                                  color: const Color.fromARGB(255, 3, 62, 109),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              (data['Question']) as String),
                          const SizedBox(height: 7),
                          Text(
                            (data['Chosen Answer']) as String,
                            style: TextStyle(color: clr, fontSize: 18),
                          ),
                          Text(
                              style: const TextStyle(fontSize: 18),
                              (data['Correct Answer']) as String),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
