import 'package:App/pages/explore/result_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  List<ResultItem> result;

  Result(this.result);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
