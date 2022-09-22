import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  Quiz(
    @required this.questions,
    @required this.questionNumber,
    @required this.changeQuestion,
    @required this.questionStatus,
    @required this.nextQuestion,
    @required this.checkNextQuestion,
  );

  final questions;
  final questionNumber;
  final void Function(String) changeQuestion;
  final questionStatus;
  final VoidCallback nextQuestion;
  final checkNextQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionNumber]['questionText']),
        SizedBox(height: 30),
        Text(
          questionStatus,
          style: TextStyle(
              color:
                  questionStatus == 'Right answer' ? Colors.green : Colors.red),
        ),
        SizedBox(height: 10,),
        // Answer(changeQuestion, questions[questionNumber]['answer'][0]),
        ...questions[questionNumber]['answer'].map((answer) {
          return Answer(() {
            changeQuestion(answer);
          }, answer);
        }),
        SizedBox(height: 30),
        
        OutlinedButton(onPressed: checkNextQuestion? nextQuestion: null, child: Text('Next Question'))
        
      ],
    );
  }
}
