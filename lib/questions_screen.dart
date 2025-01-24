import 'package:flutter/material.dart';
import 'package:myapp/answer_button.dart';
import 'package:myapp/data/quizz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/results_screen.dart';


class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}
  
class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  final List<String> selectedAnswers = [];

  void answerQuestioning(String selectedAnswer){
    setState(() {
      selectedAnswers.add(selectedAnswer);
      if (currentQuestionIndex < questions.length - 1){
        currentQuestionIndex++;
      } else{ 
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
              ResultsScreen(selectedAnswers: selectedAnswers)),
        );
        currentQuestionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.purple, Colors.deepPurple])),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentQuestion.question,
                    style: GoogleFonts.lato(
                      color: Color.fromARGB(255, 201, 153, 251),
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox( 
                    height: 30,
                  ),
                  ...currentQuestion.getShuffledAnswers().map((answer){
                    return AnswerButton(answer: answer, onTap: () => answerQuestioning(answer));
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
