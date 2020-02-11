import 'questions.dart';

class QuesBrain {
  int _questionNum = 0;

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
    for (int i = 0; i < _newQuestion.length; i++) {
      for (int j = 0; j < _newQuestion[_questionNum].choices.length; j++) {
        return _newQuestion[_questionNum].choices[j];
      }
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
