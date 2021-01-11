import 'package:flutter/material.dart';

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

  final questions = [
    {
      'questionText': 'Whats your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'Whats your favorite animal?',
      'answers': ['Fish', 'Rabbit', 'Snake', 'Elephant']
    },
    {
      'questionText': 'Whos your  favorite instructor?',
      'answers': ['Max', 'Max', 'Max']
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'],
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it'),
              ),
      ),
    );
  }
}
