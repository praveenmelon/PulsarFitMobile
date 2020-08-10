import 'package:pulsar_fit/common/extensions.dart';

class CardioLevel {
  static const low = CardioLevel._(1);
  static const medium = CardioLevel._(2);
  static const high = CardioLevel._(3);
  static List<CardioLevel> get values => [
        low,
        medium,
        high,
      ];
  final int index;
  const CardioLevel._(this.index);

  factory CardioLevel.getValue(int index) {
    return index.isInRange(1, values.length) ? CardioLevel.values[index - 1] : null;
  }
  factory CardioLevel.tryParse(String indexString) {
    var index = int.tryParse(indexString);
    return index.isInRange(1, values.length) ? CardioLevel.values[index - 1] : null;
  }
}
