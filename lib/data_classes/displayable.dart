import 'package:App/data_classes/user_owned.dart';
import 'package:flutter/widgets.dart';

/// A displayable item is type of user owned type.
/// It has a name and a method for getting a display image.
abstract class Displayable extends UserOwned {
  String _name;

  Image get displayImage;

  String get name => _name;

  set name(String name) => this._name = name;
}
