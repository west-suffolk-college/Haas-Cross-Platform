import 'package:flutter/material.dart';
import 'dart:ui';

const colours = {
  'pri' :     Color.fromRGBO(225, 0, 32, 1), //primairy
  'sec' :     Color.fromARGB(206, 151, 00, 1), //secondairy
  'ter' :     Color.fromRGBO(133, 6, 6, 1), //teriary
  'err' :     Color.fromRGBO(221, 0, 16, 1), //error
  'wrn' :     Color.fromRGBO(255, 93, 32, 1), //warning
  'suc' :     Color.fromRGBO(17, 187, 48, 1), //success
  'alt' :     Color.fromRGBO(52, 52, 52, 1), //alternitive
  'pri-txt' : Color.fromRGBO(255, 255, 255, 1), //primairy text
  'sec-txt' : Color.fromRGBO(149, 161, 172, 1), //secondairy text
  'pri-bg' :  Color.fromRGBO(34, 34, 34, 1), //primairy background
  'sec-bg' :  Color.fromRGBO(30, 30, 110, 1), //secondairy background
  'act' :     Color.fromRGBO(25, 25, 109, 1), //accent
  'invis' :   Color.fromRGBO(0, 0, 0, 0.0), //invisable
};

final screenDia = min(
  [
    window.physicalSize.width.toInt(),
    window.physicalSize.height.toInt()
  ]
);

dynamic min(List nums) {
  var lowest = nums[0];
  for (var num in nums) {
    if (num < lowest) {
      lowest = num;
    }
  }
  return lowest;
}