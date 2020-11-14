import 'package:App/components/form/form_validators.dart' as validators;
import 'package:App/components/navigation_scaffold.dart';
import 'package:App/data_classes/user.dart';
import 'package:App/components/input_feald.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/user_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class _ChangePassForm {
  String oldPass;
  String newPass;
  String newPassVerified;
}

class ChangePassPage extends StatefulWidget {
  final _userService = UserService(HttpServiceClient());
  final _formData = _ChangePassForm();
  final _user = User(
      id: 11,
      email: "skdaj",
      name: "navn test",
      username: "usernav",
      settings: null);

  ChangePassPage({Key key}) : super(key: key);

  @override
  ChangePassPageState createState() => ChangePassPageState();
}

class ChangePassPageState extends State<ChangePassPage> {
  final _formKey = GlobalKey<FormState>();

  void _handleChangePass() async {
    final FormState formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();

      var res = await widget._userService.changePass(
          newPass: widget._formData.newPass, oldPass: widget._formData.oldPass);
      if (res) {
        print("\n\nsucsess\n\n");
      } else {
        print("\n\nerror\n\n");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigation(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                widget._user.name,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 70,
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
                          label: "Old Password",
                          onSave: (newValue) =>
                              {widget._formData.oldPass = newValue},
                          validator: validators.validateNotEmptyInput,
                          hint: "Old Password"),
                      newMealInputBox(context,
                          label: "New password",
                          onSave: (newValue) => {widget._formData.newPass},
                          validator: validators.validateNotEmptyInput,
                          obscureInput: true,
                          hint: "New password"),
                      newMealInputBox(context,
                          label: "Retype new password",
                          onSave: (newValue) => {print("ccccc")},
                          validator: (value) {
                            if (value != widget._formData.newPass) {
                              return "passwords do not match";
                            }
                            return null;
                          },
                          obscureInput: true,
                          hint: "Retype new password"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: MaterialButton(
                          onPressed: _handleChangePass,
                          child: Text(
                            "Change password",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          minWidth: double.infinity,
                          color: acceptColor,
                        ),
                      ),
                      MaterialButton(
                        onPressed: _handleChangePass,
                        child: Text(
                          "Delete user",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        minWidth: double.infinity,
                        color: errorColor,
                      )
                    ])),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
