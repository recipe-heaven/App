// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultItem _$ResultItemFromJson(Map<String, dynamic> json) {
  return ResultItem(
    json['type'] as String,
    json['data'],
  );
}

Map<String, dynamic> _$ResultItemToJson(ResultItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('data', instance.data);
  return val;
}
