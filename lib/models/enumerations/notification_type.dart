import 'package:pulsar_fit/common/extensions.dart';

class NotificationType {
  static const post = NotificationType._(1);
  static List<NotificationType> get values => [
        post,
      ];
  final int index;
  const NotificationType._(this.index);

  factory NotificationType.getValue(int index) {
    return index.isInRange(1, values.length) ? NotificationType.values[index - 1] : null;
  }
  factory NotificationType.tryParse(String indexString) {
    var index = int.tryParse(indexString);
    return index.isInRange(1, values.length) ? NotificationType.values[index - 1] : null;
  }
}
