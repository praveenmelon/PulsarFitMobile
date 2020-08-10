import 'package:pulsar_fit/common/extensions.dart';

class Gender {
  static const male = Gender._(1);
  static const female = Gender._(2);
  static List<Gender> get values => [
        male,
        female,
      ];
  final int index;
  const Gender._(this.index);

  factory Gender.getValue(int index) {
    return index.isInRange(1, values.length) ? Gender.values[index - 1] : null;
  }
  factory Gender.tryParse(String indexString) {
    var index = int.tryParse(indexString);
    return index.isInRange(1, values.length) ? Gender.values[index - 1] : null;
  }
}
