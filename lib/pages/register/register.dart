import 'dart:ui';

import 'package:App/data_classes/course.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/pages/cards/input_feald.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'new_user_form_data.dart';

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
                      "Join the recipe\ncommunity",
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
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
                              style: Theme.of(context).textTheme.headline2,
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
