import 'package:flutter/material.dart';
import './quesBrain.dart';

void main() => runApp(QuestionApp());

QuesBrain quesBrain = new QuesBrain();

class QuestionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Guess the game",
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Guess the Game Character",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: GamePage(),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Text(quesBrain.getQuestionNum().toString()),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: Image.asset(
              quesBrain.getQuestionsImage(),
              width: 400,
              height: 400,
            )),
          ),
        ),
      ],
    );
  }
}
