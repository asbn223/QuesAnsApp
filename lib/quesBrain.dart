import 'questions.dart';

class QuesBrain {
  int _questionNum = 0;
  int _choiceNum = 0;

  List<Questions> _newQuestion = [
    Questions(
        question: "images/Kratos.jpg",
        answer: "Kratos",
        choices: ["Kratos", "Zeus", "Hades", "Hercules"])
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

  String getChoices() {
    _choiceNum++;
    if (_choiceNum < _newQuestion[_questionNum].choices.length) {
      return _newQuestion[_questionNum].choices.elementAt(_choiceNum - 1);
    } else {
      _choiceNum = 0;
    }
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
  }
}
