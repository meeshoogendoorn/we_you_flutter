import 'package:flutter/material.dart';

import 'package:survey_app/Containers/util.dart';
import 'package:survey_app/Widgets/appBars.dart';
import 'package:survey_app/Pages/quizStartScreen.dart';

import 'package:rich_alert/rich_alert.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:survey_app/Seeds/quizThemes.dart';

class MainEmployee extends StatefulWidget {
  MainEmployee({Key key}) : super(key: key);

  _MainEmployeeState createState() => _MainEmployeeState();
}

class _MainEmployeeState extends State<MainEmployee> {
  final bottomNavigationBarIndex = 1;
  final _quizRounds = QuizThemesSeeder.quizThemes;
  final List list = ['1', '444', 'Hello'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: fullAppbar(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => Container(
                        margin: EdgeInsets.only(left: 10, top: 15, bottom: 0),
                        child: Text(
                          'Vragenrondes',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.TextSubHeader),
                        ),
                      ),
                  childCount: 1),
            ),
            SliverGrid.count(
              crossAxisCount: 1,
              children: [
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: _quizRounds.length,
                    itemBuilder: (context, int index) {
                      List keys = _quizRounds.keys.toList();
                      return new GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizStartScreen(quizID: index),
                            ),
                          );
                        },
                        child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 65,
                                    height: 65,
                                    child: _quizRounds[keys[index]]["icon"],
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    _quizRounds[keys[index]]["title"],
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: CustomColors.TextHeaderGrey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    _quizRounds[keys[index]]["questions"]
                                        .toString() + " Vragen",
                                    style: TextStyle(
                                        fontSize: 9,
                                        color: CustomColors.TextSubHeaderGrey),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: CustomColors.GreyBorder,
                                  blurRadius: 10.0,
                                  spreadRadius: 5.0,
                                  offset: Offset(0.0, 0.0),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.all(10),
                            height: 150.0),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      floatingActionButton: customFab(context),
//      bottomNavigationBar:
//      BottomNavigationBarApp(context, bottomNavigationBarIndex),
    );
  }

  void showThemeSubmit(quizTitle, description, icon) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return RichAlertDialog(
            //uses the custom alert dialog
            alertTitle: richTitle(quizTitle),
            alertSubtitle: richSubtitle(description),
            alertType: RichAlertType.SUCCESS,
            dialogIcon: new Icon(icon),
            actions: <Widget>[
              RaisedButton(
                elevation: 2.0,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Text(
                  "Start Vragenronde",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
