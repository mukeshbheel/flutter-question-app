import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  Question(this.currentQ);

  final String currentQ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        currentQ,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
