import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:survey_app/Containers/quizTheme.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class SubmitQuizScreen extends StatefulWidget {
  @override
  _SubmitQuizScreenState createState() => _SubmitQuizScreenState();
}

class _SubmitQuizScreenState extends State<SubmitQuizScreen>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final tempHight = (MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0);
    return Container(
      color: QuizTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: new IntroViewsFlutter(
          [new PageViewModel(
        pageColor: Colors.white,
//        iconImageAssetPath: 'assets/gifs/thank_you.gif',
//        iconColor: null,
        bubbleBackgroundColor: Color(40),
        body: Text(
          'Bedankt voor het invullen van de vragenronde!',
        ),
        title: Text('Home4Talent'),
        mainImage: Image.asset(
          'assets/gifs/thank_you.gif',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Theme.of(context).accentColor),
      )],
          doneText: new Text("Verder"),
          onTapDoneButton: (){
            //Void Callback
            Navigator.pushReplacementNamed(context, '/main-employee');
          },
          pageButtonTextStyles: new TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 18.0,
            fontFamily: "Regular",
          ),
        ),
    ),
    );
  }

}
