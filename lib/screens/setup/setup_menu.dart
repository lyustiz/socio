import 'package:flutter/material.dart';
import 'package:socio/widgets/menus/app_menu.dart';

class ConfiguracionMenu extends StatelessWidget {
  const ConfiguracionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ItemsMenu> itemsMenu = [
      ItemsMenu(icon: Icons.account_circle, title: 'Cuenta', screen: 'cuenta'),
    ];

    return AppMenu(
      itemsMenu: itemsMenu,
      isHome: true,
      isLogged: false,
    );
  }
}
