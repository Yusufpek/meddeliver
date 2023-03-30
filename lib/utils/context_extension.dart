import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  //Navigation
  void navigateBack() => Navigator.pop(this);
  Future navigate(String routeName) => Navigator.pushNamed(this, routeName);
  Future navigateRemoveUntil(String routeName) =>
      Navigator.of(this).pushNamedAndRemoveUntil(routeName, (_) => false);
}
