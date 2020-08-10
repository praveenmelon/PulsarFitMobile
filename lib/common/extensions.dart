import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pulsar_fit/common/assets.dart';
import 'package:pulsar_fit/presentation/app_theme.dart';
import 'package:pulsar_fit/common/localization/localizer.dart';

extension IntegerExtensions on int {
  bool isInRange(int min, int max) => (this != null && this >= min && this <= max);
}

extension HttpExtensions on Map {
  // String toQueryString({String url: '', String prefix: '&', bool inRecursion: false}) {}
  String toQueryString({String prefix: '&', bool inRecursion: false}) {
    var query = '';

    this.forEach((key, value) {
      if (value != null) {
        if (inRecursion) {
          key = '.$key';
        }

        if (value is String || value is int || value is double || value is bool) {
          query += '$prefix$key=$value';
        } else if (value is List || value is Map) {
          if (value is List) value = value.asMap();
          value.forEach((k, v) {
            query += {
              k: v
            }.toQueryString(prefix: '$prefix$key', inRecursion: true);
          });
        }
      }
    });

    return query;
  }
}

extension BooleanExtensions on bool {
  bool getValueOrDefault() => this ?? false;
}

extension StringExtensions on String {
  bool isNullOrEmpty() => this == null || isEmpty;
  bool isNotNullOrEmpty() => !isNullOrEmpty();
  String cut(maxLength) => this == null ? '' : maxLength == null ? this : this.length < maxLength ? this : '${this.substring(0, maxLength)}...';
  String toNetworkPhotoUrl() => this ?? Assets.networkPhotoPlaceholder;
}

extension IterableExtensions on Iterable {
  bool isNullOrEmpty() => this == null || isEmpty;
  bool isNotNullOrEmpty() => !isNullOrEmpty();
  int count() => isNullOrEmpty() ? 0 : length;
  Iterable<T> mapIndexed<T>(T Function(int index, dynamic item) f) sync* {
    var index = 0;

    for (final item in this) {
      yield f(index, item);
      index++;
    }
  }
}

extension BuildContextExtensions on BuildContext {
  ThemeData theme() => Theme.of(this);
  Localizer localizer() => Localizer.of(this);
  AppThemeData appTheme() => AppTheme.of(this);
  NavigatorState navigator() => Navigator.of(this);
  MediaQueryData mediaQuery() => MediaQuery.of(this);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    if (hexString.isNullOrEmpty()) {
      return Colors.black;
    }
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension TimeOfDayExtension on TimeOfDay {
  bool isBetween(TimeOfDay left, TimeOfDay right) {
    return ((left.hour < hour || (left.hour == hour && left.minute <= minute)) && (right.hour > hour || (right.hour == hour && right.minute >= minute)));
  }
}

extension DateTimeExtensions on DateTime {
  String getDateFormat_time(Localizer localizer) => this == null ? '' : DateFormat.Hm(localizer.currentLanguage.locale.languageCode).format(this).toString();
  String getDateFormat_time_date(Localizer localizer) => this == null ? '' : '${DateFormat.Hm(localizer?.currentLanguage?.locale?.languageCode).format(this).toString()}  ${DateFormat.MEd(localizer?.currentLanguage?.locale?.languageCode).format(this).toString()}';
  String getDateFormat_MEd(Localizer localizer) => this == null ? '' : DateFormat.MEd(localizer.currentLanguage.locale.languageCode).format(this).toString();
  String getDateFormat_yMEd(Localizer localizer) => this == null ? '' : DateFormat.yMEd(localizer.currentLanguage.locale.languageCode).format(this).toString();
  String getDateFormat_yMMMMd(Localizer localizer) => this == null ? '' : DateFormat.yMMMMd(localizer.currentLanguage.locale.languageCode).format(this).toString();

  String toFriendlyString(Localizer localizer, {String fallbackDate, bool useOnlyMinutesAndHours = false}) {
    if (this == null) return '';

    final dateTime = toLocal();

    final differenceInYears = (dateTime.year - DateTime.now().year).abs() ?? 0;
    final differenceInMonths = (dateTime.month - DateTime.now().month).abs() ?? 0;
    final differenceInDays = (dateTime.day - DateTime.now().day).abs() ?? 0;
    final differenceInHours = (dateTime.hour - DateTime.now().hour).abs() ?? 0;
    final differenceInMinutes = (dateTime.minute - DateTime.now().minute).abs() ?? 0;

    if (differenceInDays == 0 && differenceInMonths == 0 && differenceInYears == 0) {
      if (differenceInHours == 0) {
        if (differenceInMinutes == 0) {
          return localizer.translation.now;
        }
        if (differenceInMinutes == 1) {
          return localizer.translation.minutesAgo1;
        }
        if (differenceInMinutes == 2) {
          return localizer.translation.minutesAgo2;
        }
        if (differenceInMinutes == 3) {
          return localizer.translation.minutesAgo3;
        }
        if (differenceInMinutes == 4) {
          return localizer.translation.minutesAgo4;
        }
        if (differenceInMinutes == 5) {
          return localizer.translation.minutesAgo5;
        }
        if (differenceInMinutes > 5 && differenceInMinutes < 10) {
          return localizer.translation.minutesAgo10;
        }
        if (differenceInMinutes >= 10 && differenceInMinutes < 20) {
          return localizer.translation.minutesAgo20;
        }
        if (differenceInMinutes >= 20 && differenceInMinutes < 30) {
          return localizer.translation.minutesAgo30;
        }
      }

      if (differenceInHours == 1) {
        return localizer.translation.hoursAgo1;
      }

      if (differenceInHours == 2) {
        return localizer.translation.hoursAgo2;
      }
      if (useOnlyMinutesAndHours ?? false) {
        return fallbackDate ?? dateTime.getDateFormat_time(localizer);
      }

      return '${dateTime.getDateFormat_time(localizer)} ${localizer.translation.today}';
    } else if (differenceInDays == 1 && differenceInMonths == 0 && differenceInYears == 0) {
      return '${dateTime.getDateFormat_time(localizer)} ${localizer.translation.yesterday}';
    } else {
      return dateTime.getDateFormat_time_date(localizer);
    }
  }
}
