import 'package:App/components/default_builder.dart';
import 'package:App/components/navigation_scaffold.dart';
import 'package:App/data_classes/menu.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/main.dart';
import 'package:App/pages/view_menu/menu_displayer.dart';
import 'package:App/service/menu_service.dart';
import 'package:flutter/material.dart';

class ViewMenuPage extends StatelessWidget {
  final int _menuId;
  Future<Menu> _menuFuture;
  //= Future.delayed(Duration(seconds: 2), () => TEST_MENU);

  ViewMenuPage(this._menuId) {
    _menuFuture = MenuService.getMenu(menuId: this._menuId);
  }

  @override
  Widget build(BuildContext context) {
    _menuFuture.timeout(Duration(seconds: 2));
    return ScaffoldWithNavigation(
      body: defaultBuilder<Menu>(
          _menuFuture,
          (Menu menu) => SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Menu Name:",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    menu?.name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  DisplayMenu(menu)
                ],
              ))),
    );
  }
}
