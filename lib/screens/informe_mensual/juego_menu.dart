import 'package:flutter/material.dart';
import 'package:socio/widgets/menus/app_menu.dart';

class JuegoMenu extends StatelessWidget {
  const JuegoMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ItemsMenu> itemsMenu = [];

    return AppMenu(
      itemsMenu: itemsMenu,
    );
  }
}
