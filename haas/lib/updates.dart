import 'package:flutter/material.dart';
import './main.dart';

void colourUpdate(bool isDark) {
  Map<String, Color> coloursBase = {
    'pri' :     const Color.fromRGBO(225, 0, 32, 1), //primairy
    'sec' :     const Color.fromARGB(206, 151, 00, 1), //secondairy
    'ter' :     const Color.fromRGBO(133, 6, 6, 1), //teriary
    'err' :     const Color.fromRGBO(221, 0, 16, 1), //error
    'wrn' :     const Color.fromRGBO(255, 93, 32, 1), //warning
    'suc' :     const Color.fromRGBO(17, 187, 48, 1), //success
    'alt' :     const Color.fromRGBO(52, 52, 52, 1), //alternitive
    'invis' :   const Color.fromRGBO(0, 0, 0, 0.0), //invisable
  };
  if (isDark) {
    coloursBase.addAll(
      const {
        'pri-txt' : Color.fromRGBO(255, 255, 255, 1), //primairy text
        'sec-txt' : Color.fromRGBO(149, 161, 172, 1), //secondairy text
        'pri-bg' :  Color.fromRGBO(34, 34, 34, 1), //primairy background
        'sec-bg' :  Color.fromRGBO(30, 30, 110, 1), //secondairy background
        'acc' :     Color.fromRGBO(25, 25, 109, 1), //accent
      }
    );
  }
  else {
    coloursBase.addAll(
      const {
        'pri-txt' : Color.fromRGBO(0, 0, 0, 1), //primairy text
        'sec-txt' : Color.fromRGBO(115, 115, 115, 1), //secondairy text
        'pri-bg' :  Color.fromRGBO(225, 225, 225, 1), //primairy background
        'sec-bg' :  Color.fromRGBO(60, 60, 220, 1), //secondairy background
        'acc' :     Color.fromRGBO(80, 80, 220, 1), //accent
      }
    );
  }
  colours = coloursBase;
}

void changeFontSize(String size) {
  double ft = 14.0;
  switch (size) {
    case 'very big':
      ft = 28.0;
      break;
    case 'big':
      ft = 20.0;
      break;
    case 'medium':
      ft = 14.0;
      break;
    case 'small':
      ft = 10.0;
      break;
    case 'very small':
      ft = 6.0;
      break;
  }
  fontSize = ft;
}

void changeLineSpace(String size) {
  double ft = 14.0;
  switch (size) {
    case 'very big':
      ft = 5.5;
      break;
    case 'big':
      ft = 4.0;
      break;
    case 'medium':
      ft = 2.5;
      break;
    case 'small':
      ft = 1.0;
      break;
    case 'very small':
      ft = 0.0;
      break;
  }
  lineSpace = ft;
}

void changeFont(String newFont) {
  font = newFont;
}

