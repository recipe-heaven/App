import 'dart:io';
import 'dart:ui';

import 'package:App/app_state.dart';
import 'package:App/pages/common_widgets/input_feald.dart';
import 'package:App/routes/routes.dart';
import 'package:App/service/auth_service.dart';
import 'package:App/service/http_client.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final authService = AuthService(HttpClient());

  LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  String _errorMessage = "";

  void _handleLogin() async {
    final FormState formState = _formKey.currentState;
    setState(() {
      _errorMessage = "";
    });
    formState.save();
    if (formState.validate()) {
      try {
        var user = await widget.authService
            .loginEmailPassword(email: _email, password: _password);
        Provider.of<AppState>(context).user = user;
        Navigator.pushReplacementNamed(context, RouteHome);
      } on HttpException catch (e) {
        setState(() {
          _errorMessage = e.message;
        });
      } on LoginException catch (e) {
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
                            onSave: (email) => {_email = email},
                            validator: null,
                            hint: "recipe@mail.com"),
                        secondaryInputField(context,
                            label: "Password",
                            onSave: (password) => {_password = password},
                            validator: (value) =>
                                value.isEmpty ? "Please enter password" : null,
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
                      Navigator.pushNamed(context, RouteUserNew);
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
