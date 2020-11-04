import 'package:App/components/navigation/bottom_navigation.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/main.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CourseMealPage extends StatefulWidget {
  Meal meal = TEST_DATA;

  BottomNavigationBar bottomNavigationBar;

  CourseMealPage({Key key}) : super(key: key);

  @override
  CourseMealState createState() => CourseMealState();
}

class CourseMealState extends State<CourseMealPage> {
  int _currentCourse = 0;
  PageController _pageController = PageController(keepPage: true);

  void _backPage() {
    setState(() {
      _currentCourse--;
      _currentCourse = _currentCourse > 0 ? _currentCourse-- : 0;
    });
  }

  Container _makePsudoNavBar() {
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
                  in widget.meal.recipe.asMap().entries) ...[
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

                  if (_currentCourse >= widget.meal.recipe.length) {
                    _currentCourse = widget.meal.recipe.length - 1;
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

  List<Widget> _makeCourseWiget() {
    var a = [
      for (Recipe c in widget.meal.recipe)
        ListView(
          children: [
            ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                      begin: Alignment(0.0, 0.0),
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).scaffoldBackgroundColor,
                        Colors.transparent
                      ]).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.network(c.imageUrl)),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          c.name,
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPressed: null)
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            color: Theme.of(context).iconTheme.color),
                        Text(
                          c.cookTime.toString(),
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline3
                              .copyWith(fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        for (var tag in c.tags) ...[
                          Text(
                            tag.tagName,
                            style: Theme.of(context).primaryTextTheme.headline4,
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ]
                      ],
                    ),
                    Text(
                      c.description,
                      style: Theme.of(context).accentTextTheme.bodyText2,
                    ),
                    Divider(
                      color: Theme.of(context).dividerColor,
                      thickness: .5,
                    ),
                    Text("Ingredients",
                        style: Theme.of(context).textTheme.headline2),
                    Column(
                      children: [
                        for (Ingredient ing in c.ingredients) ...[
                          Text(
                            "${ing.amount} ${describeEnum(ing.unitType)} ${ing.name} ${ing.comment}",
                            style: Theme.of(context).accentTextTheme.headline3,
                          )
                        ]
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ]),
            ),
            Column(
              children: [
                for (MapEntry<int, RecipeStep> entry
                    in c.cookingSteps.asMap().entries) ...[
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              child: Text(
                                entry.value.step,
                                style:
                                    Theme.of(context).accentTextTheme.bodyText2,
                              ),
                            ),
                            color: recipeStepDescriptionBackground,
                            width: double.infinity,
                          ),
                        ),
                        Container(
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/step-flag.png",
                                width: 56,
                                height: 36,
                              ),
                              Text(
                                (entry.key + 1).toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ],
                            alignment: Alignment(-0.6, -.4),
                          ),
                          alignment: Alignment(-1, 0),
                        ),
                      ],
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  ),
                ]
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )
          ],
        )
    ];
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Container(
            child: PageView(
          controller: _pageController,
          children: [..._makeCourseWiget()],
          onPageChanged: (int newVal) {
            setState(() {
              _currentCourse = newVal;
            });
          },
        )),
        //backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: _makePsudoNavBar(),
      ),
      bottomNavigationBar: navigationBar(context, (isNavigating) {}),
    );
  }
}
