import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:survey_app/Containers/util.dart';

class QuizThemesSeeder {
  QuizThemesSeeder._();

  static const Map quizThemes = {
    0:{
      "title": "Werksfeer",
      "description": "Aantal vrage over werksfeer...",
      "background-color": Color.fromRGBO(255, 155, 205, 0.36),
      "questions": 6,
      "percentage": 33,
      "open": 3,
      "multiple_choice": 4,
      "icon": Icon(FontAwesomeIcons.userFriends, color: Colors.white)
    },
    1:{
      "title": "Lunch",
      "description": "Aantal vrage over lunch...",
      "background-color": Color.fromRGBO(155, 255, 248, 0.36),
      "questions": 9,
      "percentage": 54,
      "open": 2,
      "multiple_choice": 7,
      "icon": Icon(FontAwesomeIcons.hamburger, color: Colors.white)
    },
    2:{
      "title": "VRIJMIBO",
      "description": "Aantal vrage over VRIJMIBO...",
      "background-color": Color.fromRGBO(255, 238, 155, 0.36),
      "questions": 4,
      "percentage": 88,
      "open": 0,
      "multiple_choice": 4,
      "icon": Icon(FontAwesomeIcons.beer, color: Colors.white)
    },
    3:{
      "title": "Doorgroei",
      "description": "Aantal vrage over Doorgroei...",
      "background-color": Color.fromRGBO(255, 155, 205, 0.36),
      "questions": 9,
      "percentage": 54,
      "open": 2,
      "multiple_choice": 7,
      "icon": Icon(FontAwesomeIcons.hamburger, color: Colors.white)
    },
  };

  static const Map Round = {
      0: {
        "question":"Hoe is de werksfeer? geef een cijfer tussen de 1 en de 10!",
        "answer-type": "slide",
        "divisions": 10,
      },
      1: {
        "question": "Hoe is de band met jouw collega's?",
        "answer-type": "radio",
        "answers" : {
          0: "Zeer slecht",
          1: "Slecht",
          2: "Goed",
          3: "Zeer goed",
        }
      }
  };
}