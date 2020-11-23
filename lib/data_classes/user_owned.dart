import 'package:App/data_classes/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_owned.g.dart';

/// Describes an items that has an owner.
/// An ownable item has an id, the owner and state if it is public or private
@JsonSerializable()
class UserOwned {
  int id;
  User owner;
  bool public = false;

  UserOwned();

  factory UserOwned.fromJson(Map<String, dynamic> json) =>
      _$UserOwnedFromJson(json);

  Map<String, dynamic> toJson() => _$UserOwnedToJson(this);
}
