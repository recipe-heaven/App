import 'dart:io';
import 'dart:ui';

import 'package:App/components/default_builder.dart';
import 'package:App/components/form/form_validators.dart';
import 'package:App/components/navigation_scaffold.dart';
import 'package:App/components/public_private_dialoug.dart';
import 'package:App/components/round_button.dart';
import 'package:App/components/saved_snackbar.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/components/input_feald.dart';
import 'package:App/routes/routes.dart';
import 'package:App/routes/routes_options.dart';
import 'package:App/service/recipe_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class NewRecipePage extends StatefulWidget {
  Future<CompleteRecipe> _future;
  bool _isEditing = false;

  /// if the id is -1 or not defined or the recipe cant be fetched return a new one
  /// if a valid recipe id is provided use that
  NewRecipePage({Key key, int recipeId}) : super(key: key) {
    recipeId = (recipeId == null) ? -1 : recipeId;
    if (recipeId >= 0) {
      _future =
          RecipeService.getFullRecipe(recipeId).then((CompleteRecipe value) {
        if (value == null) {
          return new CompleteRecipe();
        } else {
          _isEditing = true;
          return value;
        }
      }, onError: (e) {
        return new CompleteRecipe();
      });
    } else {
      _future = Future.value(new CompleteRecipe());
    }
  }

  @override
  NewRecipePageState createState() => NewRecipePageState();
}

class NewRecipePageState extends State<NewRecipePage> {
  final _formKey = GlobalKey<FormState>();
  CompleteRecipe _recipe;

  void _handleSaveMeal(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      final FormState formS = _formKey.currentState;
      formS.save();
      bool suc = false;
      if (widget._isEditing) {
        var image = (_image == null) ? null : _image;
        suc = await RecipeService.editRecipe(_recipe, image);
      } else {
        suc = await RecipeService.newRecipe(_recipe, _image);
      }

      if (suc) {
        displaySavedSnackbar("recipe", context);
        Navigator.popAndPushNamed(context, RouteSearch,
            arguments: SearchRouteOptions(searchOwnedOnly: true));
      } else {
        displaySavedSnackbar("recipe", context, error: true);
      }
    }
  }

  File _image;
  final picker = ImagePicker();

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _getGalleryImage();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _takeImage();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _takeImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _getGalleryImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  ImageProvider _getDisplayImage() {
    if (_image != null) {
      return Image.file(_image).image;
    } else {
      return _recipe.displayImage.image;
    }
  }

  Material _selectRecipeTypeDropdowm() {
    return inputFealdShadowWrapper(
      child: Container(
        color: Colors.transparent,

        child: DropdownButtonFormField<MealType>(
          style: Theme.of(context).textTheme.bodyText1,
          dropdownColor: elementBackgroundColor,
          isExpanded: true,
          value: _recipe.type,
          onChanged: (value) {
            setState(() {
              _recipe.type = value;
            });
          },
          isDense: true,
          items: [
            for (MealType type in MealType.values)
              DropdownMenuItem(
                value: type,
                child: Text(
                  mealTypeDisplayNames[type],
                  style: TextStyle(color: primaryTextColor),
                ),
              ),
          ],
          decoration: const InputDecoration().applyDefaults(Theme.of(context)
              .inputDecorationTheme
              .copyWith(fillColor: Theme.of(context).dialogBackgroundColor)),
        ),

        //width: MediaQuery.of(context).size.width * ,
      ),
    );
  }

  Widget _wrapWithBlur(Widget child) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: new Container(
        decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        child: child,
      ),
    );
  }

  Widget _imagePickingSquere() {
    bool newPick = _image == null && _recipe.image == null;

    Widget buttonItems = Container(
      decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera),
          Text(
            (newPick) ? "ADD PHOTO" : "CHANGE PHOTO",
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );

    return (newPick) ? _wrapWithBlur(buttonItems) : buttonItems;
  }

  Widget _showCreateRecipe(CompleteRecipe recipe, BuildContext context) {
    this._recipe = recipe;
    return ListView(
      children: [
        FlatButton(
          minWidth: double.infinity,
          onPressed: () => _showPicker(context),
          child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                        begin: Alignment(0.0, 0.0),
                        end: Alignment.bottomCenter,
                        colors: [
                      Theme.of(context).scaffoldBackgroundColor,
                      Colors.transparent
                    ])
                    .createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: _getDisplayImage(), fit: BoxFit.cover)),
                child: _imagePickingSquere(),
              )),
          padding: const EdgeInsets.all(0),
        ),
        Container(
          height: 2,
          width: double.maxFinite,
          color: Theme.of(context).backgroundColor,
        ),
        Container(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NEW RECIPE",
                        style: Theme.of(context).accentTextTheme.headline1,
                      ),
                      SetPublicDialog((state) {
                        _recipe.public = state;
                      }, _recipe.public, _recipe != null, "Recipe"),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Type",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      _selectRecipeTypeDropdowm(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: newMealInputBox(context,
                        label: "Meal Name",
                        onSave: (newValue) => {_recipe.name = newValue},
                        validator: validateNotEmptyInput,
                        initVal: _recipe.name,
                        hint: "name"),
                  ),
                  newMealInputBox(context, label: "Tags", onSave: (tags) {
                    if (tags.length >= 2) {
                      _recipe.tags = tags
                          .split(" ")
                          .map((e) => Tag(e.replaceFirst("#", "")))
                          .toList();
                    }
                  },
                      validator: validateTagFeald,
                      initVal: _getTagString(),
                      hint: "tags"),
                  newMealInputBox(context,
                      label: "Description",
                      onSave: (newValue) => {_recipe.description = newValue},
                      validator: validateNotEmptyInput,
                      initVal: _recipe.name,
                      hint: "desc"),
                  newTimeInputBox(context,
                      hedValue: "Estimated time",
                      initTime: _recipe.cookTime,
                      onSaveHour: (newValue) =>
                          {_recipe.cookTime = 60 * num.parse(newValue)},
                      onSaveMin: (newValue) =>
                          {_recipe.cookTime += num.parse(newValue)},
                      validator: validateFloatInput),
                  Row(
                    children: [
                      Text(
                        "Ingredients",
                        style: Theme.of(context).accentTextTheme.headline2,
                      ),
                      Spacer()
                    ],
                  ),
                  Column(
                    children: [
                      for (Ingredient ing in _recipe.recipeIngredients)
                        Container(
                          child: newMealIngredientInputBlock(
                            context,
                            ingredient: ing,
                            onSavedAmmount: (newValue) => {
                              _recipe
                                  .recipeIngredients[
                                      (_recipe.recipeIngredients.indexOf(ing))]
                                  .amount = num.parse(newValue.trim())
                            },
                            onSavedType: (newValue) =>
                                {ing.unitType = newValue},
                            onSavedComment: (newValue) {
                              ing.comment = newValue;
                            },
                            onPressdBack: () {
                              setState(() {
                                _recipe.recipeIngredients.remove(ing);
                              });
                            },
                            validator: null,
                            onDropdownChanged: (value) {
                              setState(() {
                                ing.unitType = value;
                              });
                            },
                          ),
                          key: ing.key,
                        ),
                      RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            _recipe.recipeIngredients.add(Ingredient());
                          });
                        },
                        elevation: 2.0,
                        fillColor: elementBackgroundColor,
                        child: Icon(Icons.add),
                        padding: EdgeInsets.all(5.0),
                        shape: CircleBorder(),
                      ),
                      Text("Add another",
                          style: Theme.of(context).textTheme.headline4)
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Steps",
                        style: Theme.of(context).accentTextTheme.headline2,
                      ),
                      Spacer()
                    ],
                  ),
                  Column(
                    children: [
                      for (MapEntry<int, RecipeStep> entry
                          in _recipe.cookingSteps.asMap().entries)
                        Container(
                          child: newMealStepInputBlock(
                            context,
                            first: entry.key == 0,
                            last: entry.key == _recipe.cookingSteps.length - 1,
                            hint: "step",
                            step: entry.value,
                            onSavedStepp: (newValue) {
                              entry.value.step = newValue;
                            },
                            hedValue: "Estimated time",
                            onPressdDown: () {
                              setState(() {
                                _recipe.cookingSteps.removeAt(entry.key);
                                _recipe.cookingSteps
                                    .insert(entry.key + 1, entry.value);
                              });
                            },
                            onPressdUp: () {
                              setState(() {
                                _recipe.cookingSteps.removeAt(entry.key);
                                _recipe.cookingSteps
                                    .insert(entry.key - 1, entry.value);
                              });
                            },
                            onPressdBack: () {
                              setState(() {
                                _recipe.cookingSteps.remove(entry.value);

                                //widget._course.cookingSteps.removeAt(widget._course.cookingSteps.indexOf(step));
                              });
                            },
                            validator: null,
                          ),
                          key: entry.value.key,
                        ),
                      RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            _recipe.cookingSteps.add(RecipeStep());
                          });
                        },
                        elevation: 2.0,
                        fillColor: elementBackgroundColor,
                        child: Icon(Icons.add),
                        padding: EdgeInsets.all(5.0),
                        shape: CircleBorder(),
                      ),
                      Text("Add another",
                          style: Theme.of(context).textTheme.headline4)
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Drinks",
                        style: Theme.of(context).accentTextTheme.headline2,
                      ),
                      DrinksSelector(_recipe.recommendedDrinks),
                      SizedBox(
                        height: 20,
                        width: double.infinity,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  RoundButton(() => _handleSaveMeal(context))
                ],
              )),
          padding: const EdgeInsets.all(10),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigation(
        body: defaultBuilder<Recipe>(widget._future,
            (Recipe meal, ctx) => _showCreateRecipe(meal, ctx)));
  }

  String _getTagString() {
    if (_recipe.tags.length == 0) {
      return "";
    } else {
      return _recipe.tags.map((e) => e.tagName).map((e) => "#" + e).join(" ");
    }
  }
}

/*

Validering pa estimated time viser bare e... < tror vi bare fjerner feedback melding og bare har rod border pa den

Dropdown for ingredients er større en andre felt

Hint fargen er off
- eneste rødfargen i palleten

Hint text mangler eller er ikke hints> tags.. -> #dessert #lowfat eks


input_feald filen har mye duplication


 */
