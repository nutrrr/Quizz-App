import 'package:flutter/material.dart';
import 'package:myapp/data/quizz.dart';

class QuestionsSummary extends StatelessWidget{

  QuestionsSummary({super.key, required this.data});

  List<Map<String, Object>> data;


  @override
  Widget build(BuildContext context) {
    return Expanded(child: SingleChildScrollView(child: Column(
      children: [
        ...data.map((questions){
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [       
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.shade100,
                      shape: BoxShape.circle
                    ),
                    alignment: Alignment.center,
                    child: Text('${(questions['question_id'] as int) + 1}'),
                  ),
            
                  SizedBox(width: 15,),
            
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${questions['question']}', style: TextStyle(color: Colors.white,fontSize: 14),),
                      Text('${questions['user_answer']}', style: TextStyle(color: Colors.red.shade300,fontSize: 12),),
                      Text('${questions['correct_answer']}', style: TextStyle(color: Colors.white,),),
                    ],
                  )
                ],
              )
            ] 
            ),
          );
        })
      ],
    ),));
    
    
  }
}