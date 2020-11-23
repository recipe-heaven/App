import 'package:App/data_classes/meal.dart';
import 'package:App/data_classes/menu.dart';
import 'package:App/data_classes/recipe.dart';

final TEST_DATA = CompleteMeal(name: "aslkdjal", recipes: [
  CompleteRecipe(
      type: MealType.main,
      cookingSteps: [
        RecipeStep(step: "steg 1 jør noe"),
        RecipeStep(step: "bipetibo"),
        RecipeStep(step: "lang neste"),
        RecipeStep(
            step:
                "He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful… the only thing he was afraid of was losing his power, which eventually, of course, he did. Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. Ironic. He could save others from death, but not himself.")
      ],
      cookTime: 1999999,
      description:
          "Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It's not a story the Jedi would tell you. It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life… ",
      name: "nvajnens",
      tags: [
        Tag("#canibalism"),
        Tag("#edgy"),
        Tag("#javasucks"),
        Tag("#tagName")
      ],
      recipeIngredients: [
        Ingredient(
            amount: 1000,
            unitType: IngredientUnit.kg,
            name: "gravel",
            comment: "finely ground"),
        Ingredient(
            amount: 2,
            unitType: IngredientUnit.cm,
            name: "penguin",
            comment: "nawww"),
        Ingredient(
            amount: 2,
            unitType: IngredientUnit.cm,
            name: "planks",
            comment: "without nails"),
        Ingredient(
            amount: 20,
            unitType: IngredientUnit.cm,
            name: "screens",
            comment: "waaaaa"),
        Ingredient(
            amount: 88,
            unitType: IngredientUnit.cm,
            name: "keys",
            comment: "waaaa"),
      ]),
  CompleteRecipe(
      type: MealType.dessert,
      cookingSteps: [
        RecipeStep(step: "steg 1 jør noe"),
        RecipeStep(step: "bipetibo"),
        RecipeStep(step: "lang neste"),
        RecipeStep(
            step:
                "He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful… the only thing he was afraid of was losing his power, which eventually, of course, he did. Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. Ironic. He could save others from death, but not himself.")
      ],
      cookTime: 1999999,
      description:
          "Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It's not a story the Jedi would tell you. It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life… ",
      name: "nvajnens",
      tags: [
        Tag("#canibalism"),
        Tag("#edgy"),
        Tag("#javasucks"),
        Tag("#tagName")
      ],
      recipeIngredients: [
        Ingredient(
            amount: 1000,
            unitType: IngredientUnit.kg,
            name: "gravel",
            comment: "finely ground"),
        Ingredient(
            amount: 2,
            unitType: IngredientUnit.cm,
            name: "penguin",
            comment: "nawww"),
        Ingredient(
            amount: 2,
            unitType: IngredientUnit.cm,
            name: "planks",
            comment: "without nails"),
        Ingredient(
            amount: 20,
            unitType: IngredientUnit.cm,
            name: "screens",
            comment: "waaaaa"),
        Ingredient(
            amount: 88,
            unitType: IngredientUnit.cm,
            name: "keys",
            comment: "waaaa"),
      ]),
]);

final TEST_DATA2 = SimpleMeal(name: "aslkdjal", recipes: [
  SimpleRecipe(
    type: MealType.main,
    cookTime: 1999999,
    description:
        "Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It's not a story the Jedi would tell you. It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life… ",
    name: "nvajnens",
  ),
  SimpleRecipe(
    type: MealType.dessert,
    cookTime: 1999999,
    description:
        "Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It's not a story the Jedi would tell you. It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life… ",
    name: "nvajnens",
  ),
]);

final TEST_MENU = Menu(meals: [new MenuItem(TEST_DATA2, 1)]);
