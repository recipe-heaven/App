import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

/// Toggleable alert widget for setting state to true/false
/// on button click. It is setup with a default state, and callback when state changes.
/// When in edit mode, it is not possible to revert to falsy state.
class SetPublicDialog extends StatefulWidget {
  final Function(bool) _stateChange;
  final _typeText;
  final _isEditing;
  var _isPublic = false;

  SetPublicDialog(
      this._stateChange, this._isPublic, this._isEditing, this._typeText,
      {Key key, String typeText})
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
            title: Text("Are you sure? \nCannot be undone after publishing."),
            actions: [
              FlatButton(
                  onPressed: () {
                    setState(() {
                      widget._isPublic = true;
                      widget._stateChange(widget._isPublic);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No"))
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
        if (!widget._isPublic) ...[
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
            height: 35,
          ),
          Spacer(),
        ],
        if (widget._isPublic) ...[
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
                  widget._isPublic = false;
                  widget._stateChange(widget._isPublic);
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
