class SettingsModel {
  String oldFcmToken;
  String fcmToken;
  bool showNotifications;

  SettingsModel({
    this.oldFcmToken,
    this.fcmToken,
    this.showNotifications = true,
  });

  SettingsModel.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      oldFcmToken = json['oldFcmToken'];
      fcmToken = json['fcmToken'];
      showNotifications = json['showNotifications'] ?? true;
    }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'oldFcmToken': oldFcmToken,
      'fcmToken': fcmToken,
      'showNotifications': showNotifications,
    };
  }
}
