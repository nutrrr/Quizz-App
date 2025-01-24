import 'package:flutter/material.dart';
import 'package:myapp/questions_screen.dart';
import 'package:myapp/start_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
            ),
          ),
          child: const StartScreen(),
        ),
      ),
    );
  }
}
