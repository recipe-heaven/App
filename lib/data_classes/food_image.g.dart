// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodImage _$FoodImageFromJson(Map<String, dynamic> json) {
  return FoodImage()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..mimeType = json['mimeType'] as String
    ..size = (json['size'] as num)?.toDouble();
}

Map<String, dynamic> _$FoodImageToJson(FoodImage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('mimeType', instance.mimeType);
  writeNotNull('size', instance.size);
  return val;
}
