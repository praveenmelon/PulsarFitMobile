import 'dart:async';
import 'dart:io';

import 'package:meta/meta.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pulsar_fit/models/local/settings_model.dart';
import 'package:pulsar_fit/repositories/storage_repository.dart';
import 'package:pulsar_fit/models/responses/firebase_message.dart';
import 'package:pulsar_fit/models/enumerations/firebase_message_status.dart';
import 'package:pulsar_fit/common/firebase_message_resolver.dart';

class FcmRepository {
  String currentFcmToken;
  final FirebaseMessaging _firebaseMessaging;
  final StorageRepository _storageRepository;
  final StreamController<FirebaseMessage> streamController = StreamController<FirebaseMessage>.broadcast();

  FcmRepository({
    @required FirebaseMessaging firebaseMessaging,
    @required StorageRepository storageRepository,
  })  : assert(firebaseMessaging != null),
        assert(storageRepository != null),
        _firebaseMessaging = firebaseMessaging,
        _storageRepository = storageRepository {
    // _configure();
  }

  Future _configure() async {
    await _firebaseMessaging.autoInitEnabled();
    await _firebaseMessaging.setAutoInitEnabled(true).then((_) => _firebaseMessaging.autoInitEnabled());

    _addListeners();

    _firebaseMessaging.onTokenRefresh.listen(
      (newToken) async {
        await _addToken(newToken);
      },
    );

    currentFcmToken = await getToken();
  }

  Future<bool> _addToken(String newFcmToken) async {}

  bool _shouldUpdateToken(SettingsModel settings, String newFcmToken) {
    return newFcmToken != settings.fcmToken && newFcmToken != null;
  }

  void _addListeners() {
    if (Platform.isIOS) {
      _iOSPermissions();
    }

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('firebaseMessaging onMessage: ${message}');
        // convert to some message type
        final firebaseMessage = FirebaseMessageResolver.resolve(message);
        // add status
        firebaseMessage.status = FirebaseMessageStatus.onMessage;
        //add to stream and cast to inherited type
        streamController.add(firebaseMessage);
      },
      onResume: (Map<String, dynamic> message) async {
        print('firebaseMessaging onResume: $message');
        final firebaseMessage = FirebaseMessageResolver.resolve(message);
        firebaseMessage.status = FirebaseMessageStatus.onResume;
        streamController.add(firebaseMessage);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('firebaseMessaging onLaunch: $message');
        final firebaseMessage = FirebaseMessageResolver.resolve(message);
        firebaseMessage.status = FirebaseMessageStatus.onLaunch;
        streamController.add(firebaseMessage);
      },
    );
  }

  void _iOSPermissions() {
    _firebaseMessaging.requestNotificationPermissions(
      IosNotificationSettings(
        sound: true,
        alert: true,
        badge: true,
      ),
    );

    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {});
  }

  Future<String> getToken() async {
    return _firebaseMessaging.getToken();
  }
}
