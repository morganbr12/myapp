import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 13) {
      resultText = 'You are good!';
    } else if (resultScore <= 16) {
      resultText = 'Try again next Time';
    } else {
      resultText = 'You are so Bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: resetHandler,
          child: Text('Reset Quiz'),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.amber),
          ),
        ),
      ],
    );
  }
}
