import 'package:pulsar_fit/common/extensions.dart';

class PlanLevel {
  static const beginner = PlanLevel._(1);
  static const intermediate = PlanLevel._(2);
  static const advanced = PlanLevel._(3);
  static List<PlanLevel> get values => [
        beginner,
        intermediate,
        advanced,
      ];
  final int index;
  const PlanLevel._(this.index);

  factory PlanLevel.getValue(int index) {
    return index.isInRange(1, values.length) ? PlanLevel.values[index - 1] : null;
  }
  factory PlanLevel.tryParse(String indexString) {
    var index = int.tryParse(indexString);
    return index.isInRange(1, values.length) ? PlanLevel.values[index - 1] : null;
  }
}
