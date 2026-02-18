import 'package:flutter/material.dart';
import 'package:quiz_app/answer_btn.dart';
import 'package:quiz_app/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(38),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerBtn(
                answerText: answer,
                onTap: (){
                  answerQuestion(answer);
                },
              ); // without being hard coded this will give btn dynamically according to the question.dart in the data folder
            }),
            // AnswerBtn(answerText: currentQuestion.answers[0], onTap: () {}),
            // AnswerBtn(answerText: currentQuestion.answers[1], onTap: () {}),
            // AnswerBtn(answerText: currentQuestion.answers[2], onTap: () {}),
            // AnswerBtn(answerText: currentQuestion.answers[3], onTap: () {}),
          ],
        ),
      ),
    );
  }
}
