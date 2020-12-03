import 'package:App/data_classes/food_image.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A info card is a card with a background image, and a text/title.
/// A remove callback can be provided to enable remove button on the card.
/// Additinal child wigets can be added beneath the title also.
class InfoCard extends StatelessWidget {
  const InfoCard(
      {Key key,
      this.title,
      this.removeCallback,
      this.children = const [],
      this.background,
      this.onPressed})
      : super(key: key);

  final String title;
  final Image background;
  final VoidCallback removeCallback;
  final List<Widget> children;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.transparent,
        child: Container(
            constraints: BoxConstraints.expand(height: 160),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(fit: StackFit.expand, children: [
              ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                            begin: Alignment(-0.5, -0.3),
                            end: Alignment(-0.60, 3),
                            colors: [Colors.black, Colors.transparent])
                        .createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: background),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title, style: TextStyle(fontSize: 26)),
                      ...children
                    ],
                  )),
              Row(
                children: _createRemoveButton(),
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              if (onPressed != null)
                TextButton(onPressed: onPressed, child: null)
            ])));
  }

  /// Creates a remove button which calls the removeCallback method
  /// when pressed. If the callback is not provided, it returns an empty list e.g no button
  List<Widget> _createRemoveButton() {
    return removeCallback != null
        ? [
            IconButton(
              icon: Icon(
                Icons.remove_circle_outline,
                color: errorColor,
              ),
              onPressed: removeCallback,
            )
          ]
        : [];
  }
}
