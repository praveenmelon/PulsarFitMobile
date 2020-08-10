import 'package:pulsar_fit/models/responses/firebase_message.dart';
import 'package:pulsar_fit/models/enumerations/notification_type.dart';

class FirebaseMessageResolver {
  static FirebaseMessage resolve(Map<String, dynamic> json) {
    final notificationType = NotificationType.tryParse(json['data']['notificationType']);

    return FirebaseMessage.fromJson(json);
  }
}
