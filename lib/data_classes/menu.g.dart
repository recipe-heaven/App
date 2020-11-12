// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu(
    name: json['name'],
    owner: json['owner'],
    public: json['public'],
    meals: json['meals'],
  );
}

Map<String, dynamic> _$MenuToJson(Menu instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('owner', instance.owner);
  writeNotNull('public', instance.public);
  writeNotNull('meals', instance.meals?.map((e) => e?.toJson())?.toList());
  return val;
}
