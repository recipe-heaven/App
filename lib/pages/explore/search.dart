import 'package:App/components/loading_spinnder.dart';
import 'package:App/pages/common_widgets/input_feald.dart';
import 'package:App/pages/explore/filter_buttons_widget.dart';
import 'package:App/pages/explore/meal_result_card.dart';
import 'package:App/pages/explore/menu_result_card.dart';
import 'package:App/pages/explore/recipe_result_card.dart';
import 'package:App/pages/explore/result.dart';
import 'package:App/pages/explore/result_item.dart';
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
// TODO: Implement filter buttons removal in search type

const meal_type_name = "meal";
const recipe_type_name = "recipe";
const menu_type_name = "menu";

class Search extends StatefulWidget {
  final SearchRouteOptions options;

  Search(this.options);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _result;
  String _searchString;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SearchState(
            widget.options.searchOwnedOnly, widget.options.returnSelected),
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
                      // TODO: Convert to type of return
                      Navigator.pop(context, searchState.selected);
                    },
                  )
                : Container();
          }),
        ));
  }

  Widget createResultText(String text) {
    print(text);
    return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Text(text, textAlign: TextAlign.left));
  }

  Future<List<Widget>> fetchSearchResult(SearchState state, context) async {
    if (_searchString != state.searchString) {
      _searchString = state.searchString;
      _result = await SearchService(HttpClient()).search(SearchOptions(
          state.searchString,
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
      String type = item.type;
      TypeSearchResult it;
      bool isSelected = false;
      String clickedRoute;

      switch (type) {
        case meal_type_name:
          it = MealSearchResult.fromMap(item.data);
          clickedRoute = RouteMealView;
          isSelected = state.selectedContains(type, it);
          card = createMealSearchResultCard(it, context, isSelected);
          break;
        case recipe_type_name:
          it = RecipeSearchResult.fromMap(item.data);
          clickedRoute = RouteRecipeView;
          isSelected = state.selectedContains(type, it);
          card = createRecipeSearchResultCard(it, isSelected);
          break;
        case menu_type_name:
          it = MenuSearchResult.fromMap(item.data);
          clickedRoute = RouteMenuNew;
          isSelected = state.selectedContains(type, it);
          card = createMenuSearchResultCard(it, isSelected);
          break;
        default:
      }
      if (card != null) {
        cards.add(GestureDetector(
            onTap: () {
              if (state.returnSelected) {
                if (isSelected) {
                  state.removeSelected(type, it);
                } else {
                  state.addSelected(type, it);
                }
              } else {
                Navigator.pushNamed(context,
                    pathWtihParameters(clickedRoute, {"id": it.id.toString()}));
              }
            },
            child: card));
      }
    }
    return cards;
  }
}
