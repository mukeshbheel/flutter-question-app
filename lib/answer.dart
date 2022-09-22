import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback submitAnswer;
  final String answerText;

  Answer(this.submitAnswer, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: submitAnswer,
        child: Text(answerText),
      ),
    );
  }
}
