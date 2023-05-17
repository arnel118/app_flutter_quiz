import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CircleAvatar(
                      backgroundColor:
                      data['user_asnwer'] == data['correct_answer']
                        ? const Color.fromARGB(255, 0, 0, 0)
                        : const Color.fromARGB(255, 202, 255, 134),
                      radius: 15,
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(116, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text(data['user_answer'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 202, 255, 134),
                      
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ],
              );
            }
          ).toList(),
        ),
      ),
    );
  }
}