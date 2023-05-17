import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
Widget build(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5), // Add margin here
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 202, 255, 134),
        foregroundColor: const Color.fromARGB(255, 31, 55, 1),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: const StadiumBorder(),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

}