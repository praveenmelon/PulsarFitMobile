import 'dart:ui';

import 'translation_model.dart';

class LanguageModel {
  final String name;
  final String iconPath;
  final Locale locale;
  final TranslationModel translation;

  LanguageModel({
    String code,
    this.name,
    this.iconPath,
    this.translation,
  }) : locale = Locale(code);
}
