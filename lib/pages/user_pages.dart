import 'package:App/data_classes/course.dart';
import 'package:App/data_classes/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/images/123.gif",
          height: double.infinity,
          repeat: ImageRepeat.repeat,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: Text(
                "Recipes Heaven",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Form(
                child: Column(children: [
              Text(
                "Email",
                style: TextStyle(
                    fontFamily: "Playfair_Display",
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField()
            ]))
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ],
      alignment: Alignment.center,
    ));
  }
}
