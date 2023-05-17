import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key, 
    required this.chosenAnswers, 
    required this.onRestart});

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

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
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final correctAnswers = summaryData
      .where((data) => data['user_answer'] == data['correct_answer']
      ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/quiz-logo.png',
              width: 60,
              color: const Color.fromARGB(255, 202, 255, 134),
            ),
            const SizedBox(
              height: 10
            ),
            Text('You answered $correctAnswers out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),           
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20
            ),
            QuestionsSummary(
              summaryData: getSummaryData(),
            ),
            const SizedBox(
              height: 30
            ),
            // FilledButton(
            //     onPressed: () {
            //       onRestart();
            //     },
            //     child: const Text('Restart Quiz', 
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white,
            //       ),
            //     ),
            // ),

            FilledButton.icon(
              onPressed: () {
              onRestart();
              },
              style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(0, 203, 255, 134),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: const StadiumBorder(side: BorderSide(color: Color.fromARGB(255, 202, 255, 134), width: 0.5)),
              ),
              icon: const Icon(
                Icons.restart_alt, 
                color: Color.fromARGB(255, 202, 255, 134),
                ),
                label: const Text('Restart Quiz', style: TextStyle(
                  fontSize: 15, 
                  color: Color.fromARGB(255, 202, 255, 134),
                ),
              ),
            ),

          ], 
        ),
      ),
    );
  }
}