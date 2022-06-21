import 'package:flutter/material.dart';
import 'package:socio/widgets/menus/app_menu.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ItemsMenu> itemsMenu = [
      ItemsMenu(icon: Icons.account_circle, title: 'Cuenta', screen: 'cuenta'),
    ];

    return AppMenu(
      itemsMenu: itemsMenu,
      isHome: true,
    );
  }
}
