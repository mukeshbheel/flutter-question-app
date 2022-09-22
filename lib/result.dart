import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  Result(this.score, this.resetQuiz);


  final int score;
  final VoidCallback resetQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You got $score correct answers.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 57, 155, 60)),),
          TextButton(onPressed: resetQuiz, child: Text('Reset Quiz'))
        ],
      ),
    );
  }
}
