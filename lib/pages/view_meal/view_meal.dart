import 'package:App/components/navigation/bottom_navigation.dart';
import 'package:App/data_classes/course.dart';
import 'package:App/data_classes/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:App/data_classes/user.dart';

class CourseMealPage extends StatefulWidget {
  Meal meal = Meal(
    courses: [
      MealCourse(
          course: Course(
              cookingSteps: [
                "steg 1 jør noe",
                "bipetibo",
                "lang neste",
                "He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful… the only thing he was afraid of was losing his power, which eventually, of course, he did. Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. Ironic. He could save others from death, but not himself."
              ],
              cookTime: 1999999,
              creator: User(),
              description:
                  "Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It's not a story the Jedi would tell you. It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life… ",
              name: "nvajnekj-dsfj-sdsadns",
              tags: [
                Tag("#canibalism"),
                Tag("#edgy"),
                Tag("#javasucks"),
                Tag("#tagName")
              ],
              ingredients: [
                Ingredient(
                    amount: 1000,
                    unitType: "tonnes",
                    name: "gravel",
                    comentidk: "finely ground"),
                Ingredient(
                    amount: 2,
                    unitType: "units",
                    name: "penguin",
                    comentidk: "nawww"),
                Ingredient(
                    amount: 2,
                    unitType: "cars",
                    name: "planks",
                    comentidk: "without nails"),
                Ingredient(
                    amount: 20,
                    unitType: "ml",
                    name: "screens",
                    comentidk: "waaaaa"),
                Ingredient(
                    amount: 88,
                    unitType: "rockets",
                    name: "keys",
                    comentidk: "waaaa"),
              ])),
      MealCourse(
          course: Course(
              cookingSteps: [
                "steg 1 jør noe",
                "bipetibo",
                "lang neste",
                "He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful… the only thing he was afraid of was losing his power, which eventually, of course, he did. Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. Ironic. He could save others from death, but not himself."
              ],
              cookTime: 1999999,
              creator: User(),
              description:
                  "Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It's not a story the Jedi would tell you. It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life… ",
              name: "nvajnens",
              tags: [
                Tag("#canibalism"),
                Tag("#edgy"),
                Tag("#javasucks"),
                Tag("#tagName")
              ],
              ingredients: [
                Ingredient(
                    amount: 1000,
                    unitType: "tonnes",
                    name: "gravel",
                    comentidk: "finely ground"),
                Ingredient(
                    amount: 2,
                    unitType: "units",
                    name: "penguin",
                    comentidk: "nawww"),
                Ingredient(
                    amount: 2,
                    unitType: "cars",
                    name: "planks",
                    comentidk: "without nails"),
                Ingredient(
                    amount: 20,
                    unitType: "ml",
                    name: "screens",
                    comentidk: "waaaaa"),
                Ingredient(
                    amount: 88,
                    unitType: "rockets",
                    name: "keys",
                    comentidk: "waaaa"),
              ])),
      MealCourse(
          course: Course(
              cookingSteps: [
                "steg 1 jør noe",
                "bipetibo",
                "lang neste",
                "He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful… the only thing he was afraid of was losing his power, which eventually, of course, he did. Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. Ironic. He could save others from death, but not himself."
              ],
              cookTime: 1999999,
              creator: User(),
              description:
                  "Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It's not a story the Jedi would tell you. It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life… ",
              name: "nvajnens",
              tags: [
                Tag("#canibalism"),
                Tag("#edgy"),
                Tag("#javasucks"),
                Tag("#tagName")
              ],
              ingredients: [
                Ingredient(
                    amount: 1000,
                    unitType: "tonnes",
                    name: "gravel",
                    comentidk: "finely ground"),
                Ingredient(
                    amount: 2,
                    unitType: "units",
                    name: "penguin",
                    comentidk: "nawww"),
                Ingredient(
                    amount: 2,
                    unitType: "cars",
                    name: "planks",
                    comentidk: "without nails"),
                Ingredient(
                    amount: 20,
                    unitType: "ml",
                    name: "screens",
                    comentidk: "waaaaa"),
                Ingredient(
                    amount: 88,
                    unitType: "rockets",
                    name: "keys",
                    comentidk: "waaaa"),
              ]))
    ],
  );
  BottomNavigationBar bottomNavigationBar;

  CourseMealPage({Key key, this.meal, this.bottomNavigationBar})
      : super(key: key);

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
        // height: 50,
        // color: Colors.grey,
        // child: Row(
        //   children: [
        //     IconButton(
        //         icon: Icon(Icons.arrow_back),
        //         onPressed: () {
        //           if (_pageController.hasClients) {
        //             _currentCourse--;

        //             if (_currentCourse < 0) {
        //               _currentCourse = 0;
        //             }
        //             _pageController.animateToPage(
        //               _currentCourse,
        //               duration: const Duration(milliseconds: 400),
        //               curve: Curves.easeInOut,
        //             );
        //           }
        //         }),
        //     Expanded(
        //         child: ListView(
        //       scrollDirection: Axis.horizontal,
        //       children: [
        //         for (MapEntry<int, MealCourse> entry
        //             in widget.meal.courses.asMap().entries) ...[
        //           TextButton(
        //             child: Text(
        //               entry.value.course.name,
        //               style: TextStyle(
        //                   color: (_currentCourse == entry.key)
        //                       ? Colors.deepOrange
        //                       : Colors.white),
        //             ),
        //             onPressed: () {
        //               if (_pageController.hasClients) {
        //                 setState(() {
        //                   _currentCourse = entry.key;
        //                 });

        //                 _pageController.animateToPage(
        //                   _currentCourse,
        //                   duration: const Duration(milliseconds: 400),
        //                   curve: Curves.easeInOut,
        //                 );
        //               }
        //             },
        //           ),
        //           SizedBox(
        //             width: 5,
        //           )
        //         ]
        //       ],
        //     )),
        //     IconButton(
        //         icon: Icon(Icons.arrow_forward),
        //         onPressed: () {
        //           if (_pageController.hasClients) {
        //             print(_currentCourse);

        //             _currentCourse++;

        //             if (_currentCourse >= widget.meal.courses.length) {
        //               _currentCourse = widget.meal.courses.length - 1;
        //             }

        //             _pageController.animateToPage(
        //               _currentCourse,
        //               duration: const Duration(milliseconds: 400),
        //               curve: Curves.easeInOut,
        //             );
        //           }
        //         }),
        //   ],
        // ),
        );
  }

  List<Widget> _makeCourseWiget() {
    return null;
    // var a = [
    //   for (MealCourse c in widget.meal.courses)
    //     ListView(
    //       children: [
    //         ShaderMask(
    //             shaderCallback: (rect) {
    //               return LinearGradient(
    //                   begin: Alignment(0.0, 0.0),
    //                   end: Alignment.bottomCenter,
    //                   colors: [
    //                     Theme.of(context).scaffoldBackgroundColor,
    //                     Colors.transparent
    //                   ]).createShader(
    //                   Rect.fromLTRB(0, 0, rect.width, rect.height));
    //             },
    //             blendMode: BlendMode.dstIn,
    //             child: Image.asset("assets/images/abc.gif")),
    //         Row(
    //           children: [
    //             Text(
    //               c.course.name,
    //               style: Theme.of(context).accentTextTheme.headline2,
    //             ),
    //             IconButton(
    //                 icon: Icon(
    //                   Icons.edit,
    //                   color: Theme.of(context).iconTheme.color,
    //                 ),
    //                 onPressed: null)
    //           ],
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         ),
    //         Row(
    //           children: [
    //             Icon(Icons.access_time,
    //                 color: Theme.of(context).iconTheme.color),
    //             Text(
    //               c.course.cookTime.toString(),
    //               style: Theme.of(context)
    //                   .primaryTextTheme
    //                   .headline3
    //                   .copyWith(fontSize: 15),
    //             )
    //           ],
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(5.0),
    //           child: Row(
    //             children: [
    //               for (var tag in c.course.tags) ...[
    //                 Text(
    //                   tag.tagName,
    //                   style: Theme.of(context).primaryTextTheme.headline4,
    //                 ),
    //                 SizedBox(
    //                   width: 5,
    //                 )
    //               ]
    //             ],
    //           ),
    //         ),
    //         Text(
    //           c.course.description,
    //           style: Theme.of(context).textTheme.bodyText1,
    //         ),
    //         Divider(
    //           color: Theme.of(context).accentColor,
    //           endIndent: 10,
    //           indent: 10,
    //           thickness: 2,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text("Ingredients",
    //               style: Theme.of(context).textTheme.headline2),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             children: [
    //               for (Ingredient ing in c.course.ingredients) ...[
    //                 Text(
    //                   "${ing.amount} ${ing.unitType} ${ing.name} ${ing.comentidk}",
    //                   style: Theme.of(context).textTheme.bodyText2,
    //                 )
    //               ]
    //             ],
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //           ),
    //         ),
    //         Column(
    //           children: [
    //             for (MapEntry<int, String> entry
    //                 in c.course.cookingSteps.asMap().entries) ...[
    //               Container(
    //                 child: Stack(
    //                   children: [
    //                     Container(
    //                       padding: const EdgeInsets.symmetric(
    //                           vertical: 10, horizontal: 0),
    //                       child: Container(
    //                         child: Padding(
    //                           padding: const EdgeInsets.symmetric(
    //                               vertical: 20, horizontal: 15),
    //                           child: Text(
    //                             entry.value,
    //                             style: Theme.of(context).textTheme.headline4,
    //                           ),
    //                         ),
    //                         color: Colors.grey,
    //                         width: double.infinity,
    //                       ),
    //                     ),
    //                     Container(
    //                       child: Stack(
    //                         children: [
    //                           Image.asset(
    //                             "assets/images/G7iK20dtZZ4.jpg",
    //                             height: 20,
    //                             alignment: Alignment(-1, -1.5),
    //                           ),
    //                           Text(
    //                             entry.key.toString(),
    //                             style: TextStyle(
    //                                 color: Colors.black,
    //                                 fontFamily: "Roboto",
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                         ],
    //                         alignment: Alignment.center,
    //                       ),
    //                       alignment: Alignment(-1, -2),
    //                     ),
    //                   ],
    //                 ),
    //                 padding:
    //                     const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
    //               ),
    //             ]
    //           ],
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //         )
    //       ],
    //     )
    // ];
    // return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [],
          onPageChanged: (int newVal) {
            setState(() {
              _currentCourse = newVal;
            });
          },
        ),
        //backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: _makePsudoNavBar(),
      ),
      bottomNavigationBar: navigationBar(context, (isNavigating) {}),
    );
  }
}
