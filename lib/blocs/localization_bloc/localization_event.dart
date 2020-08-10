import 'dart:ui';

import 'package:meta/meta.dart';

abstract class LocalizationEvent {
  const LocalizationEvent();
}

class LoadLocalizationEvent extends LocalizationEvent {}

class ChangeLocalizationEvent extends LocalizationEvent {
  final Locale locale;

  ChangeLocalizationEvent({
    @required this.locale,
  }) : assert(locale != null);
}

class ConfirmLocalizationEvent extends LocalizationEvent {
  final Locale locale;

  ConfirmLocalizationEvent({
    @required this.locale,
  }) : assert(locale != null);
}
