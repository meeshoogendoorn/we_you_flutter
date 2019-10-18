import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:survey_app/Containers/quizTheme.dart';

import 'package:survey_app/Seeds/quizThemes.dart';
import 'package:survey_app/Widgets/SliderView.dart';
import 'package:flutter/cupertino.dart';

import 'package:survey_app/Widgets/multipleChoiceView.dart';

import 'package:survey_app/Data/questionHandler.dart';

import 'dart:async';



class QuestionScreen extends StatefulWidget {
  final int quizID;
  final int quizRoundNum;

  QuestionScreen({Key key, @required this.quizID, this.quizRoundNum}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState(quizID, quizRoundNum);
}

class _QuestionScreenState extends State<QuestionScreen>
    with TickerProviderStateMixin {

  int quizID;
  int quizRoundNum;
  dynamic _answer;

  _QuestionScreenState(this.quizID, this.quizRoundNum);

  final quizRound = QuizThemesSeeder.quizThemes;



  double distValue = 10;
  final infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  var opacity1 = 0.0;
  var opacity2 = 0.0;
  var opacity3 = 0.0;


  String type;
  MultipleChoiceView answerView;


  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();

    if(quizRoundNum == null)
      quizRoundNum = 0;

    type = QuizThemesSeeder.Round[quizRoundNum]['answer-type'];
    answerView = null;


    print(QuizThemesSeeder.Round.length);

    super.initState();
  }

  void setData() async {
    animationController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tempHeight = (MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0);
    return Container(
      color: QuizTheme.nearlyWhite,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.asset('assets/images/we_you_logo.png'),
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: QuizTheme.nearlyWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: QuizTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: infoHeight,
                          maxHeight:
                          tempHeight > infoHeight ? tempHeight : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 32.0, left: 18, right: 16),
                            child: Text(
                              quizRound[quizID]['title'],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: QuizTheme.darkerText,
                              ),
                            ),
                          ),
                          Expanded(
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: opacity2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Text(
                                  QuizThemesSeeder.Round[quizRoundNum]['question'],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    letterSpacing: 0.27,
                                    color: QuizTheme.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: opacity2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 1, bottom: 8),
                                child: loadAnswerWidget(QuizThemesSeeder.Round[quizRoundNum]['answer-type'])
                              ),
                            ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 500),
                            opacity: opacity3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, bottom: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 48,
                                    height: 48,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: QuizTheme.nearlyWhite,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        border: new Border.all(
                                            color: QuizTheme.grey
                                                .withOpacity(0.2)),
                                      ),
                                      child: GestureDetector(
                                        onTap: () { Navigator.pop(context); },
                                        child: Icon(
                                          FontAwesomeIcons.arrowCircleLeft,
                                          color: Theme.of(context).accentColor,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        submitQuestion();
                                      },
                                      child: Container(
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Theme.of(context)
                                                    .accentColor
                                                    .withOpacity(0.5),
                                                offset: Offset(1.1, 1.1),
                                                blurRadius: 10.0),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Volgende vraag",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              letterSpacing: 0.0,
                                              color: QuizTheme
                                                  .nearlyWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
              right: 35,
              child: new ScaleTransition(
                alignment: Alignment.center,
                scale: new CurvedAnimation(
                    parent: animationController, curve: Curves.fastOutSlowIn),
                child: Card(
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  elevation: 10.0,
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Center(
                        child: quizRound[quizID]['icon']
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: new BorderRadius.circular(
                        AppBar().preferredSize.height),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: QuizTheme.nearlyBlack,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget sliderViewUI(divisions) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            "Kies uw antwoord:",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16, fontWeight: FontWeight.normal),
          ),
        ),
        SliderView(
          distValue: distValue,
          onChangeDistValue: (value) {
            distValue = value;
          },
          divisions: divisions,
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }


  loadAnswerWidget(typo){
    if(type == 'slide') {
      return sliderViewUI(QuizThemesSeeder.Round[quizRoundNum]['divisions']);
    } else if(type == 'radio'){
      QuestionHandler answers = QuestionHandler(quizRoundNum: quizRoundNum);
      List answerList = answers.getList();
      answerView = new MultipleChoiceView(answerList: answerList,);
      return Container(height: 350, child: answerView);
    }
  }

  submitQuestion(){
//    if(type == 'radio') {
//      print(answerView.answerList);
//      return print("no answer selected");
//    }
    if(quizRoundNum + 1 > QuizThemesSeeder.Round.length - 1)
      return  Navigator.pushReplacementNamed(context, '/submit-quiz');

    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              QuestionScreen(quizID: quizID,
                quizRoundNum: quizRoundNum +
                    1,),
        ),
      );
    }
}
