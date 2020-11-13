import 'dart:io';
import 'dart:ui';

import 'package:App/components/form/form_validators.dart';
import 'package:App/components/navigation/bottom_navigation.dart';
import 'package:App/components/navigation_scaffold.dart';
import 'package:App/data_classes/food_image.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/components/input_feald.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/recipe_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class NewRecipePage extends StatefulWidget {
  final RecipeService _service = RecipeService(HttpClient());

  @override
  NewRecipePageState createState() => NewRecipePageState();
  final Recipe _recipe = Recipe();
}

class NewRecipePageState extends State<NewRecipePage> {
  final _formKey = GlobalKey<FormState>();
  void _handleSaveMeal() async {
    if (_formKey.currentState.validate()) {
      final FormState formS = _formKey.currentState;
      formS.save();
      bool suc = await widget._service.newRecipe(widget._recipe, _image);
      print(suc);
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
    }
    if (widget._recipe.recipeImage != null) {
      return Image.network(widget._recipe.recipeImage.getImageUrl()).image;
    }
    return FoodImage().default_image.image;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigation(
      //bottomNavigationBar: navigationBar(context, (isNavigating) {}),
      body: ListView(
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
                      ]).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: _getDisplayImage(), fit: BoxFit.cover)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(0.0)),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera),
                          Text(
                            "ADD PHOTO",
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            padding: const EdgeInsets.all(0),
          ),
          Container(
            height: 2,
            width: double.maxFinite,
            color: Theme.of(context).backgroundColor,
          ),
          Text(
            "NEW RECIPE",
            style: Theme.of(context).accentTextTheme.headline1,
          ),
          Container(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    newMealInputBox(context,
                        label: "Meal Name",
                        onSave: (newValue) => {widget._recipe.name = newValue},
                        validator: validateNotEmptyInput,
                        initVal: widget._recipe.name,
                        hint: "name"),
                    newMealInputBox(context, label: "Tags", onSave: (tags) {
                      if (tags.length >= 2) {
                        widget._recipe.tags = tags
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
                        onSave: (newValue) =>
                            {widget._recipe.description = newValue},
                        validator: validateNotEmptyInput,
                        initVal: widget._recipe.name,
                        hint: "desc"),
                    newTimeInputBox(context,
                        hedValue: "Estimated time",
                        onSaveHour: (newValue) =>
                            {widget._recipe.cookTime = num.parse(newValue)},
                        onSaveMin: (newValue) =>
                            {widget._recipe.cookTime = num.parse(newValue)},
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
                        for (Ingredient ing in widget._recipe.recipeIngredients)
                          Container(
                            child: newMealIngredientInputBlock(
                              context,
                              ingredient: ing,
                              onSavedAmmount: (newValue) => {
                                widget
                                    ._recipe
                                    .recipeIngredients[(widget
                                        ._recipe.recipeIngredients
                                        .indexOf(ing))]
                                    .amount = num.parse(newValue.trim())
                              },
                              onSavedType: (newValue) =>
                                  {ing.unitType = newValue},
                              onSavedComment: (newValue) {
                                ing.comment = newValue;
                              },
                              onPressdBack: () {
                                setState(() {
                                  widget._recipe.recipeIngredients.remove(ing);
                                });
                              },
                              validator: null,
                              onDropdownChanged: (value) {
                                setState(() {
                                  print(value);
                                  ing.unitType = value;
                                });
                              },
                            ),
                            key: ing.key,
                          ),
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              widget._recipe.recipeIngredients
                                  .add(Ingredient());
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
                            in widget._recipe.cookingSteps.asMap().entries)
                          Container(
                            child: newMealStepInputBlock(
                              context,
                              first: entry.key == 0,
                              last: entry.key ==
                                  widget._recipe.cookingSteps.length - 1,
                              hint: "step",
                              step: entry.value,
                              onSavedStepp: (newValue) {
                                entry.value.step = newValue;
                              },
                              hedValue: "Estimated time",
                              onPressdDown: () {
                                setState(() {
                                  widget._recipe.cookingSteps
                                      .removeAt(entry.key);
                                  widget._recipe.cookingSteps
                                      .insert(entry.key + 1, entry.value);
                                });
                              },
                              onPressdUp: () {
                                setState(() {
                                  widget._recipe.cookingSteps
                                      .removeAt(entry.key);
                                  widget._recipe.cookingSteps
                                      .insert(entry.key - 1, entry.value);
                                });
                              },
                              onPressdBack: () {
                                setState(() {
                                  widget._recipe.cookingSteps
                                      .remove(entry.value);

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
                              widget._recipe.cookingSteps.add(RecipeStep());
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
                    SizedBox(
                      height: 20,
                    ),
                    RawMaterialButton(
                      onPressed: _handleSaveMeal,
                      elevation: 2.0,
                      fillColor: Theme.of(context).buttonColor,
                      child: Text(
                        "SAVE",
                        style: Theme.of(context).accentTextTheme.headline3,
                      ),
                      padding: EdgeInsets.all(25.0),
                      shape: CircleBorder(),
                    )
                  ],
                )),
            padding: const EdgeInsets.all(10),
          )
        ],
      ),
    );
  }

  String _getTagString() {
    if (widget._recipe.tags.length == 0) {
      return "";
    } else {
      return widget._recipe.tags
          .map((e) => e.tagName)
          .reduce((value, element) => value + " " + element);
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
