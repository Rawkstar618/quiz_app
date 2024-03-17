import 'package:flutter/material.dart';

class AnsBP extends StatelessWidget {
  final String textOnButton;
  final void Function() onTap;
  const AnsBP(this.textOnButton, this.onTap, {super.key});
  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            backgroundColor: const Color.fromARGB(100, 52, 239, 179),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              textAlign: TextAlign.center,
              textOnButton,
              style: const TextStyle(
                  color: Color.fromARGB(255, 3, 62, 109), fontSize: 22),
            ),
          ),
        ),
        const SizedBox(height: 7)
      ],
    );
  }
}
