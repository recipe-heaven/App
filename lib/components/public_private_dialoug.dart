import 'package:App/data_classes/recipe.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

class SetPublicDialog extends StatefulWidget {
  UserOwned _userOwned;
  final _typeText;
  final _isEditing;
  // final dialougeText;
  // final acceptText,
  SetPublicDialog(this._userOwned, this._isEditing, this._typeText,
      {Key key, String typeText

      // String dialougeText,
      // String acceptText,
      // String denyText
      })
      : super(key: key);

  @override
  _SetPublicDialogState createState() => _SetPublicDialogState();
}

class _SetPublicDialogState extends State<SetPublicDialog> {
  Future<void> _displayMakePublicDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        barrierColor: dialogBackgroundColor,
        builder: (BuildContext context) {
          return AlertDialog(
            title:
                Text("Make meal public? \nCannot be undone after publishing."),
            actions: [
              FlatButton(
                  onPressed: () {
                    setState(() {
                      widget._userOwned.public = true;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("yes")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("no"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${widget._typeText} is: ',
          style: Theme.of(context).textTheme.headline2,
        ),
        if (!widget._userOwned.public) ...[
          Text(
            "PRIVATE",
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(color: YeahhhhhColor),
          ),
          Spacer(),
          MaterialButton(
            child: Text("Make public"),
            color: Theme.of(context).errorColor,
            onPressed: () {
              this._displayMakePublicDialog(context);
            },
            height: 20,
          ),
          Spacer(),
        ],
        if (widget._userOwned.public) ...[
          Text(
            "PUBLIC",
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(color: errorColor),
          ),
          if (!widget._isEditing) ...[
            Spacer(),
            MaterialButton(
              child: Text("Make private"),
              color: YeahhhhhColor,
              onPressed: () {
                setState(() {
                  widget._userOwned.public = false;
                });
              },
              height: 20,
            ),
            Spacer(),
          ],
        ],
      ],
    );
  }
}
