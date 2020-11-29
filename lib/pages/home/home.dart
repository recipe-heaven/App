import 'package:App/components/default_builder.dart';
import 'package:App/components/navigation_scaffold.dart';
import 'package:App/data_classes/displayable.dart';
import 'package:App/data_classes/menu.dart';
import 'package:App/pages/view_menu/menu_displayer.dart';
import 'package:App/routes/routes.dart';
import 'package:App/routes/routes_options.dart';
import 'package:App/service/home_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Menu> _menuFuture;

  @override
  void initState() {
    _menuFuture = HomeService.getUserActiveMenu();
    super.initState();
  }

  Future<bool> _displayAreYouShureDialog(
      BuildContext context, Menu newMenu, Menu oldMenu) async {
    String changeText = "";
    if (oldMenu != null) {
      changeText = "\ncurrent menu is ${oldMenu.name} this wil be changed ";
    }
    return showDialog<bool>(
        context: context,
        barrierDismissible: true,
        barrierColor: dialogBackgroundColor,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Set ${newMenu.name}? as the new menu $changeText"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("Yes")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("No"))
            ],
          );
        });
  }

  Future<Menu> _startMenuSearch() async {
    final returnResult = await Navigator.pushNamed(context, RouteSearch,
        arguments: SearchRouteOptions(
            returnSelected: true,
            searchOwnedOnly: true,
            searchMenus: true,
            searchMeals: false,
            searchRecipes: false));

    return (returnResult as Map<String, Displayable>).values.first as Menu;
  }

  Future<void> _updateCurrentMenu(Menu current) async {
    Menu candidate = await _startMenuSearch();

    if (candidate != null && candidate?.id != current?.id) {
      bool wantChange =
          await _displayAreYouShureDialog(context, candidate, current);

      if (wantChange) {
        bool suc = await HomeService.setUserActiveMenu(candidate.id);
        if (suc) {
          setState(() {
            _menuFuture = HomeService.getUserActiveMenu();

            // possible not gettig from server poteto potato the one over is better practice given future proofing
            //_menuFuture = Future<Menu>.value(candidate);
          });
        }
      }
    }
  }

  Widget _displayMenu(Menu menu) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Current Menu:",
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          menu.name,
          style: Theme.of(context).textTheme.headline1,
        ),
        DisplayMenu(menu),
        MaterialButton(
            onPressed: () => _updateCurrentMenu(menu),
            disabledColor: disabledAcceptColor,
            color: acceptColor,
            height: 50,
            minWidth: double.maxFinite,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text("Change menu",
                style: Theme.of(context).textTheme.headline2))
      ],
    );
  }

  Widget _displayHome(Menu menu) {
    if (menu == null) {
      // no menu is set show the selector
      return _displayPicker(menu);
    } else {
      return SingleChildScrollView(child: _displayMenu(menu));
    }
  }

  Widget _displayPicker(Menu menu) {
    return Column(
      children: [
        Text("No menu selected"),
        MaterialButton(
            onPressed: () => _updateCurrentMenu(menu),
            disabledColor: disabledAcceptColor,
            color: acceptColor,
            height: 50,
            minWidth: double.maxFinite,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text("Chose menu",
                style: Theme.of(context).textTheme.headline2))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigation(
        body: defaultBuilder<Menu>(
            _menuFuture, (Menu menu) => _displayHome(menu),
            allowNull: true));
  }
}
