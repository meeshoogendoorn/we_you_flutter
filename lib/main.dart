import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:survey_app/Containers/theme.dart';
import 'package:survey_app/Pages/login.dart';
import 'package:survey_app/Pages/overview.dart';
import 'package:survey_app/Pages/submitQuizScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Root of the application.
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
        // When navigating to the "/" route, Build the LoginScreen widget.
        '/': (context) => LoginPage(),
        // When navigating to the "/example" route, build the corresponding widget.
        '/main-employee': (context) => (MainEmployee()),
        '/submit-quiz': (context) => (SubmitQuizScreen())
      },
    );
  }
}