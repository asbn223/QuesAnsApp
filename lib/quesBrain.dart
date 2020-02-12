import 'package:ques_ans_app/choices.dart';

import 'questions.dart';

class QuesBrain {
  int _questionNum = 0;
  int _correct = 0;
  int _incorrect = 0;

  static List<Questions> _newQuestion = [
    Questions(
      question: "images/Kratos.jpg",
      answer: "Kratos",
    ),
    Questions(
      question: "images/Akuma.jpg",
      answer: "Akuma",
    ),
    Questions(
      question: "images/Asuka.jpg",
      answer: "Asuka",
    ),
    Questions(
      question: "images/Dante.jpg",
      answer: "Dante",
    ),
    Questions(
      question: "images/hades.jpg",
      answer: "Hades",
    ),
    Questions(
      question: "images/Ken.jpg",
      answer: "Ken",
    ),
    Questions(
      question: "images/Ryu.jpg",
      answer: "Ryu",
    ),
    Questions(
      question: "images/Nero.jpg",
      answer: "Nero",
    ),
    Questions(
      question: "images/Vergil.jpg",
      answer: "Vergil",
    ),
    Questions(
      question: "images/king.jpg",
      answer: "King",
    )
  ];

  static int _total = _newQuestion.length;

  List<Choices> _choices = [
    Choices(
        choice1: "Kratos",
        choice2: "Zeus",
        choice3: "Hades",
        choice4: "Hercules"),
    Choices(
      choice1: "Evil Ryu",
      choice2: "Evil Ken",
      choice3: "Oni",
      choice4: "Akuma",
    ),
    Choices(
      choice1: "Asuka",
      choice2: "Kazuma",
      choice3: "Christine",
      choice4: "Panda",
    ),
    Choices(
      choice1: "Vergil",
      choice2: "Nero",
      choice3: "Dante",
      choice4: "V",
    ),
    Choices(
        choice1: "Poseidon",
        choice2: "Zeus",
        choice3: "Hades",
        choice4: "Hermus"),
    Choices(
      choice1: "Evil Ryu",
      choice2: "Evil Ken",
      choice3: "Ryu",
      choice4: "Ken",
    ),
    Choices(
      choice1: "Ryu",
      choice2: "Ken",
      choice3: "Oni",
      choice4: "Guile",
    ),
    Choices(
      choice1: "Vergil",
      choice2: "Nero",
      choice3: "Dante",
      choice4: "V",
    ),
    Choices(
      choice1: "Vergil",
      choice2: "V",
      choice3: "Mundus",
      choice4: "Lady",
    ),
    Choices(
      choice1: "Devil",
      choice2: "Devil Jin",
      choice3: "King",
      choice4: "Armor King",
    ),
  ];

  int getQuestionNum() {
    return _questionNum + 1;
  }

  String getQuestionsImage() {
    return _newQuestion[_questionNum].question;
  }

  String getAnswer() {
    return _newQuestion[_questionNum].answer;
  }

  String getChoice1() {
    return _choices[_questionNum].choice1;
  }

  String getChoice2() {
    return _choices[_questionNum].choice2;
  }

  String getChoice3() {
    return _choices[_questionNum].choice3;
  }

  String getChoice4() {
    return _choices[_questionNum].choice4;
  }

  void nextQuestion() {
    if (_questionNum < _newQuestion.length - 1) {
      _questionNum++;
    }
  }

  bool isFinished() {
    if (_questionNum < _newQuestion.length - 1) {
      return false;
    } else {
      return true;
    }
  }

  void reset() {
    _questionNum = 0;
    _correct = 0;
    _incorrect = 0;
  }

  int getCorrect() {
    return _correct;
  }

  int getInCorrect() {
    return _incorrect;
  }

  void increaseCorrect() {
    _correct++;
  }

  void increaseInCorrect() {
    _incorrect++;
  }
}
