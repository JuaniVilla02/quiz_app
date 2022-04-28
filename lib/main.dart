// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, avoid_print, no_logic_in_create_state, unused_element
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Cual es mi apodo?',
      'answers': [
        {'text': 'Juan', 'score': 5},
        {'text': 'Juani', 'score': 10},
        {'text': 'Juancito', 'score': 3},
        {'text': 'John', 'score': 1}
      ],
    },
    {
      'questionText': 'Que estoy estudiando?',
      'answers': [
        {'text': 'Computacion', 'score': 10},
        {'text': 'Biologia', 'score': 5},
        {'text': 'Administracion', 'score': 3},
        {'text': 'Nada', 'score': 0}
      ],
    },
    {
      'questionText': 'Cual es el apodo preferido de mi novia?',
      'answers': [
        {'text': 'Belu', 'score': 0},
        {'text': 'Belen', 'score': 3},
        {'text': 'Belencita', 'score': 10},
        {'text': 'Beli', 'score': 5}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cuanto conoces a Juani?'),
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
