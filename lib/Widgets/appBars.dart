import 'package:flutter/material.dart';

import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:survey_app/Containers/util.dart';
import 'package:survey_app/Widgets/chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'chart.dart';


Widget fullAppbar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(210.0),
    child: GradientAppBar(
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomPaint(
            painter: CircleOne(),
          ),
          CustomPaint(
            painter: CircleTwo(),
          ),
        ],
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
          child: Image.asset('assets/images/home4talent_logo.png'),
        ),
      ],
      elevation: 0,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Theme.of(context).primaryColor, Theme.of(context).accentColor],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
          decoration: BoxDecoration(
            color: CustomColors.HeaderGreyLight,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: SizedBox(
                      height: 100.0,
                      width: 275.0,
                      child: SimpleTimeSeriesChart(chartData),
                    ),
                  ),
                ],
              ),
//              Container(
//                width: MediaQuery.of(context).size.width / 2.9,
//              ),
//              Image.asset(
//                'assets/images/bell-left.png',
//                scale: 1.3,
//              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class CircleOne extends CustomPainter {
  Paint _paint;

  CircleOne() {
    _paint = Paint()
      ..color = CustomColors.HeaderCircle
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(28.0, 0.0), 99.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CircleTwo extends CustomPainter {
  Paint _paint;

  CircleTwo() {
    _paint = Paint()
      ..color = CustomColors.HeaderCircle
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(-30, 20), 50.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


List<charts.Series<TimeSeriesSales, DateTime>> get chartData {
  final List<TimeSeriesSales> data = <TimeSeriesSales>[
    TimeSeriesSales(DateTime(2019, 1), 40 ),
    TimeSeriesSales(DateTime(2019, 2), 25),
    TimeSeriesSales(DateTime(2019, 3), 100),
    TimeSeriesSales(DateTime(2019, 6), 75),
  ];

  return <charts.Series<TimeSeriesSales, DateTime>>[
    charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      data: data,
    )
  ];
}

class Axes{
  final String month;
  final int score;

  Axes(this.month, this.score);
}


