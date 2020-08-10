import 'package:pulsar_fit/common/extensions.dart';

class FirebaseMessageStatus {
  static const onMessage = FirebaseMessageStatus._(1);
  static const onResume = FirebaseMessageStatus._(2);
  static const onLaunch = FirebaseMessageStatus._(3);
  static List<FirebaseMessageStatus> get values => [
        onMessage,
        onResume,
        onLaunch,
      ];
  final int index;
  const FirebaseMessageStatus._(this.index);

  factory FirebaseMessageStatus.getValue(int index) {
    return index.isInRange(1, values.length) ? FirebaseMessageStatus.values[index - 1] : null;
  }
  factory FirebaseMessageStatus.tryParse(String indexString) {
    var index = int.tryParse(indexString);
    return index.isInRange(1, values.length) ? FirebaseMessageStatus.values[index - 1] : null;
  }
}
