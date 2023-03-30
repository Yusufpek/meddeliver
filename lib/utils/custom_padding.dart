import 'package:flutter/material.dart';

class CustomPadding {
  //singleton pattern
  static CustomPadding? _instance;
  CustomPadding._();
  static CustomPadding getInstance() {
    return _instance ??= CustomPadding._();
  }

  EdgeInsets noPadding = EdgeInsets.zero;

  // private padding functions
  static EdgeInsets _symmetricPadding(double vertical, double horizontal) =>
      EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
  static EdgeInsets _allPadding(double all) => EdgeInsets.all(all);

  // all paddings
  EdgeInsets allPadding(double all) => _allPadding(all);
  EdgeInsets smallPadding = _allPadding(8);
  EdgeInsets mediumPadding = _allPadding(16);
  EdgeInsets largerPadding = _allPadding(32);
  EdgeInsets largestPadding = _allPadding(64);

  // symmetric paddings
  EdgeInsets symmetricPadding({double vertical = 0, double horizontal = 0}) =>
      _symmetricPadding(vertical, horizontal);
}
