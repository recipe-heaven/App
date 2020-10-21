import 'dart:ui';

import 'package:App/data_classes/course.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/pages/cards/input_feald.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class LoginFormData {
  String username;
  String password;

  LoginFormData();
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _loginFormData;

  @override
  void initState() {
    super.initState();
    _loginFormData = LoginFormData();
  }

  void _handleLogin() {
    // todo
    if (_formKey.currentState.validate()) {
      final FormState formS = _formKey.currentState;
      formS.save();

      print("Username: " + _loginFormData.username);
      print("Password: " + _loginFormData.password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("assets/images/BG-LOGIN.png"),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
                child: Text(
                  "Recipes Heaven",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
                        userScreenInpBox(context,
                            hedValue: "Email",
                            onSave: (newValue) =>
                                {_loginFormData.username = newValue},
                            validator: null,
                            hint: "mail"),
                        userScreenInpBox(context,
                            hedValue: "Password",
                            onSave: (newValue) =>
                                {_loginFormData.password = newValue},
                            validator: null,
                            obscureInput: true,
                            hint: "••••••••"),
                        TextButton(
                            onPressed: _handleLogin,
                            child: Text(
                              "Login",
                              style:
                                  Theme.of(context).accentTextTheme.headline3,
                            ))
                      ])),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                  )),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Column(
            children: [
              Container(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/user/register");
                    },
                    child: Text(
                      "Create New user",
                      style: Theme.of(context).accentTextTheme.headline3,
                    )),
                padding: const EdgeInsets.only(bottom: 60),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Copyright 1337 - floofservice",
                  style: Theme.of(context).accentTextTheme.caption,
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ],
        alignment: Alignment.center,
        fit: StackFit.expand,
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class NewUserFormData {
  String username;
  String name;
  String password;

  NewUserFormData();
}

class NewUserPage extends StatefulWidget {
  NewUserPage({Key key}) : super(key: key);

  @override
  NewUserPageState createState() => NewUserPageState();
}

class NewUserPageState extends State<NewUserPage> {
  final _formKey = GlobalKey<FormState>();
  NewUserFormData _newUserFormData;

  @override
  void initState() {
    super.initState();
    _newUserFormData = NewUserFormData();
  }

  void _handleRegister() {
    // todo
    if (_formKey.currentState.validate()) {
      final FormState formS = _formKey.currentState;
      formS.save();
      print("Username: " + _newUserFormData.username);
      print("Username: " + _newUserFormData.name);
      print("Password: " + _newUserFormData.password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("assets/images/BG-NEW-USER.png"),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
                child: Column(
                  children: [
                    Text(
                      "Join the recipe",
                      style: Theme.of(context).accentTextTheme.headline2,
                    ),
                    Text(
                      "community",
                      style: Theme.of(context).accentTextTheme.headline2,
                    ),
                  ],
                ),
              ),
              Container(
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
                        userScreenInpBox(context,
                            hedValue: "Email",
                            onSave: (newValue) =>
                                {_newUserFormData.username = newValue},
                            validator: null,
                            hint: "mail"),
                        userScreenInpBox(context,
                            hedValue: "Full name",
                            onSave: (newValue) =>
                                {_newUserFormData.name = newValue},
                            validator: null,
                            hint: "Name"),
                        userScreenInpBox(context,
                            hedValue: "Password",
                            onSave: (newValue) =>
                                {_newUserFormData.password = newValue},
                            validator: null,
                            obscureInput: true,
                            hint: "••••••••"),
                        userScreenInpBox(context,
                            hedValue: "Repeat Password",
                            onSave: (newValue) =>
                                {_newUserFormData.password = newValue},
                            validator: null,
                            obscureInput: true,
                            hint: "••••••••"),
                        TextButton(
                            onPressed: _handleRegister,
                            child: Text(
                              "Join",
                              style:
                                  Theme.of(context).accentTextTheme.headline3,
                            ))
                      ])),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                  )),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
        alignment: Alignment.center,
        fit: StackFit.expand,
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
