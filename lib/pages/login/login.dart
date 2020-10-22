import 'dart:ui';

import 'package:App/pages/cards/input_feald.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'login_form_data.dart';

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
                  style: logoTextStyle,
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
          Column(
            children: [
              Container(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/user/register");
                    },
                    child: Text(
                      "Create New user",
                      style: Theme.of(context).textTheme.headline2,
                    )),
                padding: const EdgeInsets.only(bottom: 60),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Copyright ${DateTime.now().year} - foodservice",
                  style: Theme.of(context).textTheme.caption,
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
