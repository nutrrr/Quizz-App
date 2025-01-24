import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answer, 
    required this.onTap,
    });

  final String answer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 33, 1, 95),
              foregroundColor: Colors.white,
            ),
            child: Text(answer,
              textAlign: TextAlign.center,
            ),
            
          ),
        ),
      ],
    );
  }
}
