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

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('email', instance.email);
  writeNotNull('name', instance.name);
  writeNotNull('username', instance.username);
  writeNotNull('settings', instance.settings?.toJson());
  return val;
}

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return UserSettings()..unit = json['unit'] as String;
}

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unit', instance.unit);
  return val;
}
