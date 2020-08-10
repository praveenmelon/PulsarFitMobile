import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode themeMode;

  ThemeState({@required this.themeMode}) : assert(themeMode != null);
}
