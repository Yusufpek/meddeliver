import 'package:flutter/material.dart';

class CustomTextStyle {
  //singleton pattern
  static CustomTextStyle? _instance;
  CustomTextStyle._();
  static CustomTextStyle getInstance() {
    return _instance ??= CustomTextStyle._();
  }

  final TextStyle bigTitle = const TextStyle(fontSize: 32);

  final TextStyle welcomeTextStyle = const TextStyle(
    fontSize: 48,
    fontFamily: "Inter",
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
