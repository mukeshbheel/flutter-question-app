// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:first_application/quiz.dart';
import 'package:first_application/result.dart';
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText':
          'You are 4th place right now in a race. What place will you be in when you pass the person in 3rd place?',
      'answer': ['1st', '2nd', '3rd', 'none of the above'],
      'rightAnswer': '3rd',
    },
    {
      'questionText': 'How many months have 28 days?',
      'answer': [
        '2',
        '1',
        'All of them',
        'Depends if there is a leap year or not'
      ],
      'rightAnswer': 'All of them',
    },
    {
      'questionText':
          'How many 0.5cm slices can you cut from a bread that is 25cm long? ',
      'answer': ['50', '25', '39', 'none of the above'],
      'rightAnswer': '50',
    },
  ];

  var _questionNumber = 0;
  var _score = 0;
  String _questionStatus = '';
  int preQuestionNumber = -1;
  bool _checkNextQuestion = false;

  void _changeQuestion(answerText) {
    if (preQuestionNumber != _questionNumber) {
      preQuestionNumber = _questionNumber;
      setState(() {
        _checkNextQuestion = true;
      });
      if (answerText == _questions[_questionNumber]['rightAnswer']) {
        setState(() {
          _score++;
          _questionStatus = 'Right answer';
        });
      } else {
        setState(() {
          _questionStatus = 'Wrong answer';
        });
      }
    }
  }

  void _nextQuestion() {
    setState(() {
      _questionNumber++;
      _questionStatus = '';
      _checkNextQuestion = false;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionNumber = 0;
      _score = 0;
      _checkNextQuestion = false;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mind Bend'),
          centerTitle: true,
        ),
        body: _questionNumber < _questions.length
            ? Quiz(_questions, _questionNumber, _changeQuestion,
                _questionStatus, _nextQuestion, _checkNextQuestion)
            : Result(_score, _resetQuiz),
      ),
    );
  }
}
