import 'dart:io';
import 'dart:ui';

import 'package:App/components/form/form_validators.dart';
import 'package:App/components/input_feald.dart';
import 'package:App/routes/routes.dart';
import 'package:App/service/auth_service.dart';
import 'package:App/service/http_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'new_user_form_data.dart';

class NewUserPage extends StatefulWidget {
  NewUserPage({Key key}) : super(key: key);
  final authService = AuthService(HttpClient());

  @override
  NewUserPageState createState() => NewUserPageState();
}

class NewUserPageState extends State<NewUserPage> {
  final _formKey = GlobalKey<FormState>();
  NewUserFormData _newUserFormData;
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
    _newUserFormData = NewUserFormData();
  }

  void _handleRegister() async {
    final FormState formState = _formKey.currentState;
    setState(() {
      _errorMessage = "";
    });
    formState.save();
    if (formState.validate()) {
      try {
        await widget.authService.createUser(_newUserFormData);
        Navigator.pushReplacementNamed(context, RouteUserLogin);
      } on HttpException catch (e) {
        setState(() {
          _errorMessage = e.message;
        });
      } on CreateUserException catch (e) {
        setState(() {
          _errorMessage = e.message;
        });
      }
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
          SingleChildScrollView(
              child: Column(
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
              Text(
                _errorMessage,
                style: TextStyle(color: Theme.of(context).errorColor),
              ),
              Container(
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
                        secondaryInputField(context,
                            label: "Email",
                            onSave: (newValue) =>
                                {_newUserFormData.email = newValue},
                            validator: (value) {
                              return validateEmail(value);
                            },
                            hint: "mail"),
                        secondaryInputField(context,
                            label: "Username",
                            onSave: (newValue) =>
                                {_newUserFormData.username = newValue},
                            validator: (value) {
                              return validateNotEmptyInput(value);
                            },
                            hint: "username"),
                        secondaryInputField(context,
                            label: "Full name",
                            onSave: (newValue) =>
                                {_newUserFormData.name = newValue},
                            validator: (value) {
                              return validateNotEmptyInput(value);
                            },
                            hint: "Name"),
                        secondaryInputField(context,
                            label: "Password",
                            onSave: (newValue) =>
                                {_newUserFormData.password = newValue},
                            validator: (value) {
                              return validateLength(value, min: 6);
                            },
                            obscureInput: true,
                            hint: "••••••••"),
                        secondaryInputField(context, label: "Repeat Password",
                            validator: (value) {
                          return validateEquality(
                              value, _newUserFormData.password, "password");
                        }, obscureInput: true, hint: "••••••••"),
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
          )),
        ],
        alignment: Alignment.center,
        fit: StackFit.expand,
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
