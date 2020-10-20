import 'package:App/data_classes/course.dart';

class Meal {
  List<MealCourse> courses;

  Meal({this.courses});
}

class MealCourse {
  Course course;
  List<String> drinks;

  MealCourse({this.course, this.drinks});
}
