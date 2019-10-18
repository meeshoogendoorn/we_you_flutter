import 'package:survey_app/Seeds/quizThemes.dart';

import 'package:survey_app/Widgets/multipleChoiceView.dart';


class QuestionHandler {
  int quizRoundNum;
  List<RadioModel> answerList = [];
  Map answers = QuizThemesSeeder.Round;

  QuestionHandler({
    this.quizRoundNum = 0,
  }) {
    int prefix;
    String charCodes;
    var intCharCode = 'a'.codeUnits.first;

    for (var i = 0; i < answers[quizRoundNum]['answers'].length; i++) {
      if(intCharCode > 'z'.codeUnits.first){
        if(prefix == null)
          prefix = 'a'.codeUnits.first;
        else {
          prefix++;
        }
        intCharCode = 'a'.codeUnits.first;
      }

      if(prefix != null)
        charCodes = String.fromCharCode(prefix) + String.fromCharCode(intCharCode);
      else
        charCodes = String.fromCharCode(intCharCode);

      addList(false ,answers[quizRoundNum]['answers'][i], charCodes);
      intCharCode++;
    }
  }

  addList(isSelected, label, identifier) {
    answerList.add(RadioModel(isSelected, identifier, label));
  }

  List getList() {
    return answerList;
  }
}

