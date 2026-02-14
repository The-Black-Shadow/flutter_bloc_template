import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  // Shortcuts for Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  Color get primaryColor => Theme.of(this).primaryColor;

  // Shortcuts for Media Query
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  // Navigation shortcut (if not using GoRouter context.go)
  void pop() => Navigator.of(this).pop();
}

//usages
// // OLD
// Container(
//   color: Theme.of(context).primaryColor,
//   width: MediaQuery.of(context).size.width,
// )

// // NEW (Clean!)
// Container(
//   color: context.primaryColor,
//   width: context.width,
// )
