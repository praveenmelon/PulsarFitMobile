import 'package:pulsar_fit/common/extensions.dart';

class StrengthLevel {
  static const low = StrengthLevel._(1);
  static const medium = StrengthLevel._(2);
  static const high = StrengthLevel._(3);
  static List<StrengthLevel> get values => [
        low,
        medium,
        high,
      ];
  final int index;
  const StrengthLevel._(this.index);

  factory StrengthLevel.getValue(int index) {
    return index.isInRange(1, values.length) ? StrengthLevel.values[index - 1] : null;
  }
  factory StrengthLevel.tryParse(String indexString) {
    var index = int.tryParse(indexString);
    return index.isInRange(1, values.length) ? StrengthLevel.values[index - 1] : null;
  }
}
