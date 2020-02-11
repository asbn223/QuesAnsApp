import 'package:flutter/material.dart';
import './quesBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  int score;

  void scores(bool userChoices) {
    setState(() {
      if (quesBrain.isFinished()) {
        Alert(
            title: "Congralutions",
            context: context,
            desc: "Your total scored is: $score.",
            buttons: [
              DialogButton(
                child: Text(
                  "Ok",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              )
            ]).show();
        quesBrain.reset();
        score = 0;
      } else {
        if (userChoices == true) {
          score = score + 10;
        }
      }
      quesBrain.nextQuestion();
    });
  }

  Widget choiceCard() {
    return FlatButton(
      child: Text(
        quesBrain.getChoices(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Qno. " + quesBrain.getQuestionNum().toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Divider(
          color: Colors.blueGrey,
          thickness: 4,
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 300,
//          width: 250,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Image.asset(
                quesBrain.getQuestionsImage(),
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              choiceCard(),
              choiceCard(),
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              choiceCard(),
              choiceCard(),
            ],
          ),
        ),
      ],
    );
  }
}
