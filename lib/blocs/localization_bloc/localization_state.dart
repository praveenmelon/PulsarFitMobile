import 'dart:ui';

import 'package:meta/meta.dart';

class LocalizationState {
  final Locale locale;

  const LocalizationState({
    @required this.locale,
  }) : assert(locale != null);
}

class ChangedLocalizationState extends LocalizationState {
  const ChangedLocalizationState({
    @required Locale locale,
  })  : assert(locale != null),
        super(locale: locale);
}

class UnfinishedLocalizationState extends LocalizationState {
  const UnfinishedLocalizationState({
    @required Locale locale,
  })  : assert(locale != null),
        super(locale: locale);
}
