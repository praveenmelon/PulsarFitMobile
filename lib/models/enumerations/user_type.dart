import 'package:pulsar_fit/common/extensions.dart';

class UserType {
  static const superadmin = UserType._(1);
  static const admin = UserType._(2);
  static const trainer = UserType._(3);
  static const client = UserType._(4);
  static List<UserType> get values => [
        superadmin,
        admin,
        trainer,
        client,
      ];
  final int index;
  const UserType._(this.index);

  factory UserType.getValue(int index) {
    return index.isInRange(1, values.length) ? UserType.values[index - 1] : null;
  }
  factory UserType.tryParse(String indexString) {
    var index = int.tryParse(indexString);
    return index.isInRange(1, values.length) ? UserType.values[index - 1] : null;
  }
}
