// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as num,
    email: json['email'] as String,
    name: json['name'] as String,
    username: json['username'] as String,
    settings: json['settings'] == null
        ? null
        : UserSettings.fromJson(json['settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'username': instance.username,
      'settings': instance.settings,
    };

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return UserSettings()..unit = json['unit'] as String;
}

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) =>
    <String, dynamic>{
      'unit': instance.unit,
    };
