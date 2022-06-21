import 'package:flutter/material.dart';
import 'package:socio/widgets/menus/app_menu.dart';

class SyncMenu extends StatelessWidget {
  const SyncMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ItemsMenu> itemsMenu = [
      ItemsMenu(icon: Icons.people, title: 'Clientes', screen: ''),
    ];
    return AppMenu(
      itemsMenu: itemsMenu,
    );
  }
}
