import '../enumerations/gender.dart';
import '../enumerations/user_type.dart';
import 'city.dart';
import 'multimedia_file.dart';
import 'user_setting.dart';
import 'trainer.dart';
import 'user_role.dart';

class User {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  Gender gender;
  UserType userType;
  String profilePhotoUrl;
  int cityId;
  int multimediaFileId;
  City city;
  MultimediaFile multimediaFile;
  UserSetting userSetting;
  Trainer trainer;
  List<UserRole> userRoles;

  User({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.userType,
    this.profilePhotoUrl,
    this.cityId,
    this.multimediaFileId,
    this.city,
    this.multimediaFile,
    this.userSetting,
    this.trainer,
    this.userRoles,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        gender: Gender?.getValue(json['gender']),
        userType: UserType.getValue(json['userType']),
        profilePhotoUrl: json['profilePhotoUrl'],
        cityId: json['cityId'],
        multimediaFileId: json['multimediaFileId'],
        city: City.fromJson(json['city']),
        multimediaFile: MultimediaFile.fromJson(json['multimediaFile']),
        userSetting: UserSetting.fromJson(json['userSetting']),
        trainer: Trainer.fromJson(json['trainer']),
        userRoles: json['userRoles']?.map<UserRole>((json) => UserRole.fromJson(json))?.toList(),
      );
    }
    return null;
  }
}
