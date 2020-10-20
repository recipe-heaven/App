import 'package:App/data_classes/course.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/data_classes/user.dart';
import 'package:App/pages/course_pages.dart';
import 'package:App/pages/user_pages.dart';
import 'package:flutter/material.dart';
import 'designstuff/themes.dart' as app_themes;

import 'examples/nested_path_ex.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Meal m = Meal(
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

  BottomNavigationBar _bottomNavigationBar = BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.adb,
            color: Colors.white,
          ),
          activeIcon: Icon(Icons.accessible_forward_sharp, color: Colors.red),
          label: "alal"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.baby_changing_station,
            color: Colors.white,
          ),
          activeIcon: Icon(Icons.accessible_forward_sharp, color: Colors.red),
          label: "glg"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.bathtub_sharp,
            color: Colors.white,
          ),
          activeIcon: Icon(Icons.accessible_forward_sharp, color: Colors.red),
          label: "ieius")
    ],
    backgroundColor: Colors.yellow,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: app_themes.mainTheme,
      onGenerateRoute: (settings) {
        // go home //
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => LoginPage()
              //CourseMealPage(meal: m, bottomNavigationBar: _bottomNavigationBar)
              );
        }

        print('THIS IS BAD');

        // Handle '/details/:id'
        var uri = Uri.parse(settings.name);
        if (uri.pathSegments.length >= 2) {
          // ---------- user ---------- //
          if (uri.pathSegments.first == "user") {
            if (uri.pathSegments[1] == "new") {
              // @ /user/new
              return null;
            } else if (uri.pathSegments[1] == "login") {
              // @ /user/login
              return null;
            }
          }
          // ---------- menu ---------- //
          else if (uri.pathSegments.first == "menu") {
            if (uri.pathSegments[1] == "new") {
              // @ /menu/new
              return null;
            } else if (uri.pathSegments[1] == "today") {
              // @ /menu/today
              return null;
            } else if (uri.pathSegments[1] == "shopping_list" &&
                uri.pathSegments.length == 3) {
              // @ /menu/shopping_list/:id
              return null;
            } else {
              // @ /menu/:id
              return null;
            }
          }

          // ---------- meal ---------- //
          else if (uri.pathSegments.first == "meal") {
            if (uri.pathSegments[1] == "new") {
              // @ /meals/new
              return null;
            } else {
              // @ /meals/:id
              var id = uri.pathSegments[1];
              // TODO: get the correct meal from db here
              return null;
            }
          }

          // ---------- course ---------- //
          else if (uri.pathSegments.first == "user") {
            if (uri.pathSegments[1] == "new") {
              // @ /courses/new
              return null;
            } else {
              // @ /courses/:id
              return null;
            }
          }
        }

        return MaterialPageRoute(builder: (context) => Path404Page());
      },
    );
  }
}

class Path404Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("ERROR SIDE NOT FOUND"
          "/side note burde kansje ha en vei ut av skjermen her"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _buttonNavClicked(int index, BuildContext b) {
    Scaffold.of(b).showSnackBar(SnackBar(
      content: Text(index.toString()),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
        bottomNavigationBar: Builder(
          builder: (ctx) => BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.ac_unit_outlined), label: "shopping"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.food_bank), label: "meals"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.read_more), label: "recipies"),
            ],
            onTap: (int a) {
              _buttonNavClicked(a, ctx);
            },
            selectedItemColor: Colors.amberAccent,
          ),
        ));
  }
}
