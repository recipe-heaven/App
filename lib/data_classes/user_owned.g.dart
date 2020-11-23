// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_owned.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOwned _$UserOwnedFromJson(Map<String, dynamic> json) {
  return UserOwned()
    ..id = json['id'] as int
    ..owner = json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>)
    ..public = json['public'] as bool;
}

Map<String, dynamic> _$UserOwnedToJson(UserOwned instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner', instance.owner?.toJson());
  writeNotNull('public', instance.public);
  return val;
}
