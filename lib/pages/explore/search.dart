import 'package:App/components/loading_spinnder.dart';
import 'package:App/components/input_feald.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/data_classes/menu.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/helpers/consts.dart';
import 'package:App/pages/explore/filter_buttons_widget.dart';
import 'package:App/pages/explore/meal_result_card.dart';
import 'package:App/pages/explore/menu_result_card.dart';
import 'package:App/pages/explore/recipe_result_card.dart';
import 'package:App/pages/explore/result.dart';
import 'package:App/pages/explore/search_options.dart';
import 'package:App/pages/explore/search_state.dart';
import 'package:App/routes/router.dart';
import 'package:App/routes/routes.dart';
import 'package:App/routes/routes_options.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/search_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// TODO: Disable navigation if search is from Create(menu, meal) page

class Search extends StatefulWidget {
  final SearchRouteOptions options;

  Search(this.options);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _result;
  String _searchString = "";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SearchState(widget.options),
        child: Scaffold(
          body: Builder(builder: (context) {
            return SafeArea(

                // Page wrapper
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top search bar
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: inputField(context,
                                hint: "Search",
                                inputAction: TextInputAction.done,
                                onFieldSubmitted: (searchString) {
                          Provider.of<SearchState>(context).searchString =
                              searchString;
                        })),
                        FilterButtons(widget.options),
                        Divider(
                          color: Theme.of(context).dividerColor,
                          thickness: .5,
                        ),
                      ],
                    ),

                    Expanded(
                      child: Consumer<SearchState>(
                        builder: (context, searchState, child) {
                          return FutureBuilder<List<Widget>>(
                            future: fetchSearchResult(searchState, context),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Widget>> snapshot) {
                              List<Widget> children;
                              if (snapshot.hasData) {
                                children = <Widget>[
                                  createResultText(
                                      "Found ${snapshot.data.length.toString()} results"),
                                  ...snapshot.data
                                ];
                              } else if (snapshot.hasError) {
                                children = <Widget>[
                                  createResultText("Failed to get a result...")
                                ];
                              } else {
                                children = <Widget>[getCircularSpinner()];
                              }
                              return ListView(children: children);
                            },
                          );
                        },
                      ),
                    ),
                  ]),
            ));
          }),
          floatingActionButton:
              Consumer<SearchState>(builder: (context, searchState, child) {
            return widget.options.returnSelected &&
                    searchState.selected.length > 0
                ? FloatingActionButton(
                    child: Icon(
                      Icons.add,
                      color: primaryTextColor,
                      size: 26.0,
                      semanticLabel: 'List icon',
                    ),
                    onPressed: () {
                      Navigator.pop(context, searchState.selected);
                    },
                  )
                : Container();
          }),
        ));
  }

  Widget createResultText(String text) {
    return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Text(text, textAlign: TextAlign.left));
  }

  Future<List<Widget>> fetchSearchResult(SearchState state, context) async {
    if (_searchString != state.searchString) {
      _searchString = state.searchString;
      _result = await SearchService(HttpServiceClient()).search(SearchOptions(
          state.searchString,
          widget.options.recipeType,
          state.ownedOnly,
          state.includeMeal,
          state.includeMenu,
          state.includeRecipe));
    }
    return createCards(_result, context);
  }

  List<Widget> createCards(Result res, context) {
    List<Widget> cards = new List();
    if (res == null) return cards;

    var state = Provider.of<SearchState>(context, listen: false);

    for (var item in res.result) {
      Widget card;
      bool isSelected = false;
      String clickedRoute;
      String type;

      if (item.runtimeType == Recipe) {
        type = recipe_type_name;
        clickedRoute = RouteRecipeView;
        isSelected = state.selectedContains(type, item);
        card = RecipeSearchResultCard(item, context, selected: isSelected);
      } else if (item.runtimeType == Meal) {
        type = meal_type_name;
        clickedRoute = RouteMealView;
        isSelected = state.selectedContains(type, item);
        card = MealSearchResultCard(item, context, selected: isSelected);
      } else if (item.runtimeType == Menu) {
        type = menu_type_name;
        clickedRoute = RouteMenuView;
        isSelected = state.selectedContains(type, item);
        card = MenuSearchResultCard(item, context, selected: isSelected);
      }

      if (card != null) {
        cards.add(GestureDetector(
            onTap: () {
              if (state.returnSelected) {
                if (isSelected) {
                  state.removeSelected(type, item);
                } else {
                  if (!state.selectMultiple) {
                    state.clearAndAddSelected(type, item);
                  } else {
                    state.addSelected(type, item);
                  }
                }
              } else {
                Navigator.pushNamed(
                    context,
                    pathWtihParameters(
                        clickedRoute, {"id": item.id.toString()}));
              }
            },
            child: card));
      }
    }
    return cards;
  }
}
