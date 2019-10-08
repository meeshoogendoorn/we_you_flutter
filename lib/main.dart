import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:survey_app/Containers/theme.dart';
import 'package:survey_app/Pages/login.dart';
import 'package:survey_app/Pages/main_employee.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeContainer>(
      child: Consumer<ThemeContainer>(
        builder: this.builder,
      ),
      builder: (context) => new ThemeContainer(),
    );
  }

  Widget builder(BuildContext context, container, __) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: container.primary,
        accentColor: container.accent,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/main-employee': (context) => (MainEmployee()),
      },
    );
  }
}