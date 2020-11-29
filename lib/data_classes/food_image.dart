import 'dart:ui';

import 'package:App/data_classes/recipe.dart';
import 'package:App/service/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_image.g.dart';

@JsonSerializable(explicitToJson: true)
class FoodImage {
  final defaultImage = Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/RedDot_Burger.jpg/1599px-RedDot_Burger.jpg",
      fit: BoxFit.cover);
  int id;
  String name;
  String mimeType;
  double size;

  FoodImage();

  factory FoodImage.fromJson(Map<String, dynamic> json) =>
      _$FoodImageFromJson(json);

  Map<String, dynamic> toJson() => _$FoodImageToJson(this);

  String getImageUrl() {
    return getImageEndpoint + "$id";
  }
}
