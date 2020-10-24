import 'package:App/data_classes/course.dart';

class Menu {
  String name;
  String owner;
  String public;

  List<MenuCourse> recipes;
}

class MenuCourse {
  Recipe recipe;
  String day;
}
