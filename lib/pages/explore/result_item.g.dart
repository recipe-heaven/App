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

Map<String, dynamic> _$ResultItemToJson(ResultItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };
