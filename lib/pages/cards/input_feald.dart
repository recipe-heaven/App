import 'dart:ffi';

import 'package:App/components/form/form_validators.dart';
import 'package:App/data_classes/course.dart';
import 'package:App/theme/themes.dart';
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
            style: Theme.of(context).textTheme.headline2,
          ),
          padding: const EdgeInsets.only(bottom: 4),
        ),
        Container(
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
          decoration: shadowBoxDecoration,
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
    String initVal,
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
            style: Theme.of(context).textTheme.headline2,
          ),
          padding: const EdgeInsets.only(bottom: 4),
        ),
        Container(
          child: TextFormField(
            validator: validator,
            initialValue: initVal,
            onSaved: onSave,
            obscureText: obscureInput,
            decoration: const InputDecoration()
                .applyDefaults(Theme.of(context).inputDecorationTheme.copyWith(
                    fillColor: Theme.of(context).dialogBackgroundColor))
                .copyWith(
                  hintText: hint,
                ),
          ),
          decoration: shadowBoxDecoration,
        )
      ],
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
    padding: const EdgeInsets.symmetric(vertical: 10),
  );
}

Container newTimeInputBox(BuildContext context,
    {String hedValue,
    FormFieldSetter<String> onSaveHour,
    FormFieldSetter<String> onSaveMin,
    FormFieldValidator<String> validator,
    bool obscureInput = false,
    String hint = ""}) {
  return Container(
    child: Column(
      children: [
        Padding(
          child: Text(
            hedValue,
            style: Theme.of(context).textTheme.headline2,
          ),
          padding: const EdgeInsets.only(bottom: 4),
        ),
        Row(
          children: [
            Container(
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: validator,
                    onSaved: onSaveHour,
                    obscureText: obscureInput,
                    decoration: const InputDecoration().applyDefaults(
                        Theme.of(context).inputDecorationTheme.copyWith(
                            fillColor:
                                Theme.of(context).dialogBackgroundColor))),
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: shadowBoxDecoration),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hours",
                style: Theme.of(context).accentTextTheme.headline3,
              ),
            ),
            Container(
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: validator,
                  onSaved: onSaveMin,
                  obscureText: obscureInput,
                  decoration: const InputDecoration().applyDefaults(
                      Theme.of(context).inputDecorationTheme.copyWith(
                          fillColor: Theme.of(context).dialogBackgroundColor))),
              width: MediaQuery.of(context).size.width * 0.1,
              decoration: shadowBoxDecoration,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Minutes",
                style: Theme.of(context).accentTextTheme.headline3,
              ),
            ),
          ],
        )
      ],
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
    padding: const EdgeInsets.symmetric(vertical: 10),
  );
}

Container newMealIngredientInputBlock(
    BuildContext context, //int ingredient_idx,
    {Ingredient ingredient,
    FormFieldSetter<String> onSavedAmmount,
    FormFieldSetter<IngredientUnit> onSavedType,
    FormFieldSetter<String> onSavedComment,
    ValueChanged<IngredientUnit> onDropdownChanged,
    VoidCallback onPressdBack,
    FormFieldValidator<String> validator,
    bool obscureInput = false,
    String hint = ""}) {
  return Container(
    //key: ingredient.key, //Key("ingredient-" + ingredient.name),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: validateFloatInput,
                  onSaved: onSavedAmmount,
                  obscureText: obscureInput,
                  decoration: const InputDecoration().applyDefaults(
                      Theme.of(context).inputDecorationTheme.copyWith(
                          fillColor: Theme.of(context).dialogBackgroundColor))),
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: shadowBoxDecoration,
              padding: const EdgeInsets.only(right: 10),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              child: DropdownButtonFormField<IngredientUnit>(
                  value: ingredient.unitType,
                  onSaved: onSavedType,
                  onChanged: onDropdownChanged,
                  items: [
                    DropdownMenuItem(
                      value: IngredientUnit.a,
                      child: Text("aa"),
                    ),
                    DropdownMenuItem(
                      value: IngredientUnit.b,
                      child: Text("bb"),
                    ),
                    DropdownMenuItem(
                      value: IngredientUnit.c,
                      child: Text("cc"),
                    ),
                  ],
                  decoration: const InputDecoration().applyDefaults(
                      Theme.of(context).inputDecorationTheme.copyWith(
                          fillColor: Theme.of(context).dialogBackgroundColor))),
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: shadowBoxDecoration,
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.cancel_outlined),
              onPressed: onPressdBack,
              color: Theme.of(context).errorColor,
            )
          ],
        ),
        Container(
          child: TextFormField(
              validator: validateAnyInputt,
              onSaved: onSavedComment,
              obscureText: false,
              decoration: const InputDecoration().applyDefaults(
                  Theme.of(context).inputDecorationTheme.copyWith(
                      fillColor: Theme.of(context).dialogBackgroundColor))),
          width: MediaQuery.of(context).size.width,
          decoration: shadowBoxDecoration,
          padding: const EdgeInsets.only(right: 10),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
    padding: const EdgeInsets.symmetric(vertical: 10),
  );
}

Container newMealStepInputBlock(BuildContext context, //int ingredient_idx,
    {RecipeStep step,
    bool first = false,
    bool last = false,
    String hedValue,
    FormFieldSetter<String> onSavedStepp,
    VoidCallback onPressdBack,
    VoidCallback onPressdUp,
    VoidCallback onPressdDown,
    FormFieldValidator<String> validator,
    String hint = ""}) {
  return Container(
    child: Column(
      children: [
        Stack(
          children: [
            if (!first)
              Center(
                child: IconButton(
                  onPressed: onPressdUp,
                  icon: Icon(Icons.arrow_upward),
                ),
              ),
            Row(
              children: [
                Spacer(),
                IconButton(
                  icon: Icon(Icons.cancel_outlined),
                  onPressed: onPressdBack,
                  color: Theme.of(context).errorColor,
                ),
              ],
            )
          ],
        ),
        Container(
          child: TextFormField(
              initialValue: step.step,
              validator: validateAnyInputt,
              maxLines: null,
              onSaved: onSavedStepp,
              decoration: const InputDecoration().applyDefaults(
                  Theme.of(context).inputDecorationTheme.copyWith(
                      fillColor: Theme.of(context).dialogBackgroundColor))),
          width: MediaQuery.of(context).size.width,
          decoration: shadowBoxDecoration,
          padding: const EdgeInsets.only(right: 10),
        ),
        if (!last)
          Center(
            child: IconButton(
              onPressed: onPressdDown,
              icon: Icon(Icons.arrow_downward),
            ),
          ),
      ],
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
    padding: const EdgeInsets.symmetric(vertical: 10),
  );
}
