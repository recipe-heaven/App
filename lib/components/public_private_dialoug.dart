import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

/// Toggleable alert widget for setting state to true/false
/// on button click. It is setup with a default state, and callback when state changes.
/// When in edit mode, it is not possible to revert to falsy state.
class SetPublicDialog extends StatefulWidget {
  final Function(bool) _stateChange;
  final String _typeText;
  final bool _isEditing;
  bool _isPublic = false;

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
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: primaryTextColor),
        ),
        if (!widget._isPublic) ...[
          Text(
            "private",
            style:
                Theme.of(context).textTheme.headline5.copyWith(color: okColor),
          ),
          Spacer(),
          MaterialButton(
            child: Text("Make public",
                style: Theme.of(context).textTheme.bodyText1),
            color: Theme.of(context).errorColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {
              this._displayMakePublicDialog(context);
            },
            height: 35,
          ),
        ],
        if (widget._isPublic) ...[
          Text(
            "public",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: errorColor),
          ),
          if (!widget._isEditing) ...[
            Spacer(),
            MaterialButton(
              child: Text("Make private",
                  style: Theme.of(context).textTheme.bodyText1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: okColor,
              onPressed: () {
                setState(() {
                  widget._isPublic = false;
                  widget._stateChange(widget._isPublic);
                });
              },
              height: 35,
            ),
          ],
        ],
      ],
    );
  }
}
