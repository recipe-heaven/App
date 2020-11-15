import 'dart:convert';

import 'package:App/components/loading_spinnder.dart';
import 'package:App/components/navigation/bottom_navigation.dart';
import 'package:App/components/navigation_scaffold.dart';
import 'package:App/data_classes/food_image.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/main.dart';
import 'package:App/pages/view_recipe/recipe_displayer.dart';
import 'package:App/pages/view_recipe/view_recipe.dart';
import 'package:App/service/meal_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CourseMealPage extends StatefulWidget {
  final int _mealId;
  CourseMealPage(this._mealId, {Key key}) : super(key: key);

  @override
  CourseMealState createState() => CourseMealState();
}

class CourseMealState extends State<CourseMealPage> {
  Future<Meal> _mealFuture;
  int _currentCourse = 0;
  PageController _pageController = PageController(keepPage: true);

  @override
  void initState() {
    _mealFuture = MealService.getExample(widget._mealId);
    super.initState();
  }

  Container _makePsudoNavBar(Meal meal) {
    return Container(
      height: 45,
      color: elementBackgroundColor,
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                if (_pageController.hasClients) {
                  _currentCourse--;
                  if (_currentCourse < 0) {
                    _currentCourse = 0;
                  }
                  _pageController.animateToPage(
                    _currentCourse,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              }),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (MapEntry<int, Recipe> entry
                  in meal.recipe.asMap().entries) ...[
                TextButton(
                  child: Text(entry.value.name,
                      style: (_currentCourse == entry.key)
                          ? courseNavbarTextStyleActive
                          : courseNavbarTextStyle),
                  onPressed: () {
                    if (_pageController.hasClients) {
                      setState(() {
                        _currentCourse = entry.key;
                      });

                      _pageController.animateToPage(
                        _currentCourse,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
                SizedBox(
                  width: 5,
                )
              ]
            ],
          )),
          IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                if (_pageController.hasClients) {
                  print(_currentCourse);

                  _currentCourse++;

                  if (_currentCourse >= meal.recipe.length) {
                    _currentCourse = meal.recipe.length - 1;
                  }

                  _pageController.animateToPage(
                    _currentCourse,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              }),
        ],
      ),
    );
  }

  Widget _showMeal(Meal meal) {
    return Scaffold(
      body: Container(
          child: PageView(
        controller: _pageController,
        children: [
          for (Recipe recipe in meal.recipe) DisplayRecipe(recipe),
        ],
        onPageChanged: (int newVal) {
          setState(() {
            _currentCourse = newVal;
          });
        },
      )),
      //backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: _makePsudoNavBar(meal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigation(
      body: FutureBuilder(
          future: _mealFuture,
          builder: (context, AsyncSnapshot<Meal> snapshot) {
            if (snapshot.hasData) {
              return _showMeal(snapshot.data);
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting result...'),
                  )
                ],
              );
            } else {
              return getCircularSpinner();
            }
          }),
    );
  }
}
