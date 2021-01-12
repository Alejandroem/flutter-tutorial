import 'package:flutter/material.dart';
import 'package:fluttertutorial/quiz.dart';
import 'package:fluttertutorial/result.dart';

import 'question.dart';
import 'answer.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = [
    {
      'questionText': 'Whats your favorite color?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 5,
        },
        {
          'text': 'Green',
          'score': 3,
        },
        {
          'text': 'White',
          'score': 1,
        },
      ]
    },
    {
      'questionText': 'Whats your favorite animal?',
      'answers': [
        {
          'text': 'Fish',
          'score': 1,
        },
        {
          'text': 'Rabbit',
          'score': 1,
        },
        {
          'text': 'Snake',
          'score': 1,
        },
        {
          'text': 'Elephant',
          'score': 1,
        },
      ]
    },
    {
      'questionText': 'Whos your  favorite instructor?',
      'answers': [
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        }
      ]
    },
  ];

  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
