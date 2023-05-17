import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(255, 202, 255, 134),
          ),
          const SizedBox(height: 40),
          Text('Learn Flutter the fun way!',
              style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white
              ),
          ),
          const SizedBox(height: 30),
          // FilledButton.icon(
          //   onPressed: () {
          //     startQuiz();
          //   },
          //   icon: const Icon(Icons.quiz),
          //   label: const Text('Start Quiz'),
          // )
          FilledButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: FilledButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 202, 255, 134),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: const StadiumBorder(side: BorderSide(color: Color.fromARGB(255, 202, 255, 134), width: 2)),
            ),
            icon: const Icon(
              Icons.quiz, 
              color: Color.fromARGB(255, 31, 55, 1),
              ),
              label: const Text('Start Quiz', style: TextStyle(
                fontSize: 15, 
                color: Color.fromARGB(255, 31, 55, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }    
}