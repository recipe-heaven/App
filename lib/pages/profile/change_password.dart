import 'package:App/app_state.dart';
import 'package:App/components/form/form_validators.dart' as validators;
import 'package:App/components/navigation_scaffold.dart';
import 'package:App/components/input_feald.dart';
import 'package:App/components/round_button.dart';
import 'package:App/components/saved_snackbar.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class _ChangePassForm {
  String oldPass = "";
  String newPass = "";
  String newPassVerified = "";
}

class ChangePassPage extends StatefulWidget {
  final _userService = UserService(HttpServiceClient());
  final _formData = _ChangePassForm();

  ChangePassPage({Key key}) : super(key: key);

  @override
  ChangePassPageState createState() => ChangePassPageState();
}

class ChangePassPageState extends State<ChangePassPage> {
  final _formKey = GlobalKey<FormState>();

  void _handleChangePass(BuildContext context) async {
    final FormState formState = _formKey.currentState;
    formState.save();
    if (formState.validate()) {
      var success = await widget._userService.changePass(
          newPass: widget._formData.newPass, oldPass: widget._formData.oldPass);
      if (success) {
        displaySavedSnackbar("password", context, updated: true);
      } else {
        displaySavedSnackbar("password", context, error: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AppState>(context).user;
    return ScaffoldWithNavigation(
      body: Builder(
        builder: (context) => SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Column(
                  children: [
                    Divider(
                      color: Theme.of(context).dividerColor,
                      thickness: .5,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Change Password",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(children: [
                          newMealInputBox(context,
                              label: "New password",
                              onSave: (newValue) =>
                                  widget._formData.newPass = newValue,
                              validator: (value) {
                                return validators.multivalidate([
                                  () => validators.validateNotEmptyInput(value),
                                  () => validators.validateLength(value, min: 6)
                                ]);
                              },
                              obscureInput: true,
                              hint: "New password"),
                          newMealInputBox(context,
                              label: "Retype new password",
                              onSave: (newValue) =>
                                  widget._formData.newPassVerified = newValue,
                              validator: (value) {
                                return validators.multivalidate([
                                  () => validators.validateNotEmptyInput(value),
                                  () => validators.validateEquality(value,
                                      widget._formData.newPass, "new password")
                                ]);
                              },
                              obscureInput: true,
                              hint: "Retype new password"),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: RoundButton(
                              () {
                                _handleChangePass(context);
                              },
                              buttonText: "Save",
                            ),
                          )
                        ])),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
