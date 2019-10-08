import 'package:flutter/material.dart';

import 'package:survey_app/Containers/util.dart';
import 'package:survey_app/Widgets/appBars.dart';

class MainEmployee extends StatefulWidget {
  MainEmployee({Key key}) : super(key: key);

  _MainEmployeeState createState() => _MainEmployeeState();
}

class _MainEmployeeState extends State<MainEmployee> {
  final bottomNavigationBarIndex = 1;

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
              crossAxisCount: 2,
              children: [
                Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            child: Image.asset('assets/images/icon-user.png'),
                            decoration: const BoxDecoration(
                              color: CustomColors.YellowBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Werkfeer',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '6 vragen',
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
                Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            child: Image.asset('assets/images/icon-briefcase.png'),
                            decoration: const BoxDecoration(
                              color: CustomColors.GreenBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Lunch',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '4 vragen',
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
                Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            child: Image.asset('assets/images/icon-confetti.png'),
                            decoration: const BoxDecoration(
                              color: CustomColors.BlueBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Vrijmibo',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '3 vragen',
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
                Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            child: Image.asset('assets/images/icon-molecule.png'),
                            decoration: const BoxDecoration(
                              color: CustomColors.PurpleBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Doorgroei',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '10 vragen',
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
}
