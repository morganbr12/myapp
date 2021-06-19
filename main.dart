import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _quetions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'white', 'score': 1},
        {'text': 'blue', 'score': 7},
        {'text': 'green', 'score': 3},
        {'text': 'pink', 'score': 5},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal',
      'answers': [
        {'text': 'jay', 'score': 8},
        {'text': 'kin', 'score': 2},
        {'text': 'bebe', 'score': 4},
        {'text': 'pinky', 'score': 6},
      ],
    },
    {
      'questionText': 'what\'s your favorite subject',
      'answers': [
        {'text': 'python', 'score': 8},
        {'text': 'dart', 'score': 5},
        {'text': 'c++', 'score': 10},
        {'text': 'java', 'score': 3},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuize() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _quetions.length) {
      print("there is more questions to answer");
    } else {
      print('you have no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My first App'),
      ),
      body: _questionIndex < _quetions.length
          ? Quiz(
              questionIndex: _questionIndex,
              quetions: _quetions,
              answerQuestion: _answerQuestion,
            )
          : Result(_totalScore, _resetQuize),
    );
  }
}
