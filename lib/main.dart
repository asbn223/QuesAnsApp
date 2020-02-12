import 'package:flutter/cupertino.dart';
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
  int score = 0;

  void scores(String userChoices) {
    setState(() {
      if (userChoices == quesBrain.getAnswer()) {
        score = score + 10;
        quesBrain.increaseCorrect();
      } else {
        quesBrain.increaseInCorrect();
      }

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
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]).show();
        quesBrain.reset();
        score = 0;
      } else {
        quesBrain.nextQuestion();
      }
    });
  }

  Widget counter(String text) {
    return Card(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(3),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget chioceBtn({@required String text}) {
    return FlatButton(
      child: Card(
        child: Container(
          width: 125,
          height: 50,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 18, letterSpacing: 2, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      onPressed: () {
        scores(text);
      },
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
          height: 275,
          width: 275,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Image.asset(
                quesBrain.getQuestionsImage(),
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            chioceBtn(text: quesBrain.getChoice1()),
            chioceBtn(text: quesBrain.getChoice2()),
          ],
        ),
        Row(
          children: <Widget>[
            chioceBtn(text: quesBrain.getChoice3()),
            chioceBtn(text: quesBrain.getChoice4()),
          ],
        ),
        Divider(
          color: Colors.blueGrey,
          thickness: 4,
        ),
        SizedBox(
          width: 20,
        ),
        Row(
          children: <Widget>[
            counter("Corrent Answer: " + quesBrain.getCorrect().toString()),
            counter("Incorrect Answer: " + quesBrain.getInCorrect().toString()),
          ],
        ),
        counter("Total Score: " + score.toString()),
      ],
    );
  }
}
