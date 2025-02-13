import 'package:flutter/material.dart';
import 'package:myapp/data/quizz.dart';
import 'package:myapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/questions_summary.dart';


class ResultsScreen extends StatelessWidget {

const ResultsScreen({required this.selectedAnswers, super.key});

final List<String> selectedAnswers;

List<String> getCorrectAnswers(){
  List<String> corAns = [];
  for(int i=0; i<questions.length; i++){
    corAns.add(questions[i].getCorrectAnswers());
  }
  return corAns;
}

List<Map<String, Object>> getSummaryData(){
  List<Map<String, Object>> summaryData = [];
  List<String> correctAnswers = getCorrectAnswers();
  for (var i = 0; i < selectedAnswers.length; i++) {
    bool is_correct = selectedAnswers[i] == correctAnswers[i];
    summaryData.add(
      {
        'question_id': i,
        'question': questions[i].question,
        'user_answer': selectedAnswers[i],
        'correct_answer': correctAnswers[i],
        'is_correct': is_correct
      }
    );
  }

  return summaryData;
}

int chackAnswers(answers, corAnswers){
  int correctAmount = 0;
  for(int i=0; i<selectedAnswers.length; i++){
    if(answers[i] == corAnswers[i]){
      correctAmount++;
    }
  }
  return correctAmount++;
}

@override
  Widget build(BuildContext context) {
    List<String> correctAnswers = getCorrectAnswers();
    int correctAnsAmount = chackAnswers(selectedAnswers, correctAnswers);

    List<Map<String, Object>> summaryData = getSummaryData();

    return MaterialApp(
      home: Scaffold(
    body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "You answered ${correctAnsAmount.toString()} out of ${selectedAnswers.length.toString()}\nqiestions correctly",
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
          QuestionsSummary(data: summaryData),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              onPressed: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => MyApp())
                );
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: const Text(
                "Restart Quiz",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    )
  )));
  }
}