// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'No me conoces';
    if (resultScore <= 8) {
      resultText = 'Me conoces muy poco :(';
    } else if (resultScore <= 12) {
      resultText = 'Me conoces!';
    } else if (resultScore >= 12) {
      resultText = 'Me conoces muy bien :) !';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            child: Text('Reiniciar test'),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
