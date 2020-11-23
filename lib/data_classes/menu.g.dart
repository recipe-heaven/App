// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu(
    name: json['name'] as String,
    meals: _menuItemsFromJson(json['meals'] as List),
    recipes: _menuItemsFromJson(json['recipes'] as List),
    id: json['id'] as int,
    owner: json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>),
    public: json['public'] as bool,
  );
}

Map<String, dynamic> _$MenuToJson(Menu instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner', instance.owner?.toJson());
  writeNotNull('public', instance.public);
  writeNotNull('name', instance.name);
  writeNotNull('meals', instance.meals?.map((e) => e?.toJson())?.toList());
  writeNotNull('recipes', instance.recipes?.map((e) => e?.toJson())?.toList());
  return val;
}

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return MenuItem(
    _menuItemFromJson(json['item'] as String),
    json['day'],
  );
}

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('day', instance.day);
  writeNotNull('item', _menuItemToJson(instance.item));
  return val;
}

NewMenu _$NewMenuFromJson(Map<String, dynamic> json) {
  return NewMenu(
    json['name'] as String,
    json['public'] as bool,
    (json['menuItems'] as List)
        ?.map((e) =>
            e == null ? null : MenuItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..id = json['id'] as int
    ..owner = json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>);
}

Map<String, dynamic> _$NewMenuToJson(NewMenu instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner', instance.owner?.toJson());
  writeNotNull('public', instance.public);
  writeNotNull('name', instance.name);
  writeNotNull('menuItems', _menuItemsToJson(instance.items));
  return val;
}
