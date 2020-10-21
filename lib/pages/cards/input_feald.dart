import 'package:flutter/material.dart';

Container userScreenInpBox(BuildContext context,
    {String hedValue,
    FormFieldSetter<String> onSave,
    FormFieldValidator<String> validator,
    bool obscureInput = false,
    String hint = ""}) {
  return Container(
    child: Column(
      children: [
        Padding(
          child: Text(
            hedValue,
            style: Theme.of(context).accentTextTheme.headline4,
          ),
          padding: const EdgeInsets.only(bottom: 4),
        ),
        Material(
          child: TextFormField(
            validator: validator,
            onSaved: onSave,
            obscureText: obscureInput,
            decoration: const InputDecoration()
                .applyDefaults(Theme.of(context).inputDecorationTheme)
                .copyWith(
                  hintText: hint,
                ),
          ),
          shadowColor: Theme.of(context).shadowColor,
          elevation: 10,
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
    padding: const EdgeInsets.symmetric(vertical: 10),
  );
}

Container newMealInputBox(BuildContext context,
    {String hedValue,
    FormFieldSetter<String> onSave,
    FormFieldValidator<String> validator,
    bool obscureInput = false,
    String hint = ""}) {
  return Container(
    child: Column(
      children: [
        Padding(
          child: Text(
            hedValue,
            style: Theme.of(context).accentTextTheme.headline4,
          ),
          padding: const EdgeInsets.only(bottom: 4),
        ),
        Material(
          child: TextFormField(
            validator: validator,
            onSaved: onSave,
            obscureText: obscureInput,
            decoration: const InputDecoration()
                .applyDefaults(Theme.of(context).inputDecorationTheme.copyWith(
                    fillColor: Theme.of(context).dialogBackgroundColor))
                .copyWith(
                  hintText: hint,
                ),
          ),
          shadowColor: Theme.of(context).shadowColor,
          elevation: 10,
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
    padding: const EdgeInsets.symmetric(vertical: 10),
  );
}
