import 'dart:convert';

import 'package:pulsar_fit/models/enumerations/firebase_message_status.dart';
import 'package:pulsar_fit/models/enumerations/notification_type.dart';

class FirebaseMessage {
  String title;
  String body;
  String data;
  Map<String, dynamic> get dataAsJson => json.decode(data);
  // field [status] is used internally and not recognized outside mobile app
  FirebaseMessageStatus status;
  NotificationType notificationType;

  FirebaseMessage({
    this.title,
    this.body,
    this.notificationType,
    this.data,
  });

  factory FirebaseMessage.fromJson(Map<String, dynamic> json) {
    return FirebaseMessage().fromJson(json);
  }

  FirebaseMessage fromJson(Map<String, dynamic> json) {
    title = json['notification']['title'];
    body = json['notification']['body'];
    notificationType = NotificationType.tryParse(json['data']['notificationType']);
    data = json['data']['body'];

    return this;
  }
}
