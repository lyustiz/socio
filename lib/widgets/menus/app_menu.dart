import 'package:flutter/material.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/help_button.dart';
import 'package:socio/widgets/layout/logo.dart';

class AppMenu extends StatelessWidget {
  final List<ItemsMenu> itemsMenu;
  final bool isHome;
  final bool isLogged;
  AppMenu(
      {Key? key,
      required this.itemsMenu,
      this.isHome = false,
      this.isLogged = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.9), BlendMode.difference)),
            color: Colors.white),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: DrawerHeader(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.secondaryVariant,
                        ],
                      )),
                  margin: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Logo(titulo: 'Bingo JL', fontSize: 0),
                      ),
                      Row(
                        children: [HelpButton()],
                      )
                    ],
                  )),
            ),
            ...itemsMenu.map((item) {
              return ListTile(
                leading: Icon(
                  item.icon,
                  color: item.color ??
                      Theme.of(context).colorScheme.secondaryVariant,
                ),
                title: Text(
                  item.title,
                  style: TextStyle(
                      color:
                          item.color ?? Theme.of(context).colorScheme.secondary,
                      fontSize: 14),
                ),
                onTap: () => pushScreen(context, item.screen),
              );
            }).toList(),
            /*ListTile(
              leading: const Icon(
                Icons.change_circle_outlined,
                color: Colors.amber,
              ),
              title: Text('Sincronizar',
                  style: TextStyle(color: Colors.amber[600])),
              onTap: () => navigateTo(context, 'sincronizar'),
            ),*/
            Divider(
              color: Theme.of(context).colorScheme.secondaryVariant,
            ),
            if (!isHome)
              ListTile(
                leading: Icon(Icons.home, color: Colors.green[500]),
                title: Text(
                  'Inicio',
                  style: TextStyle(color: Colors.green[500]),
                ),
                onTap: () => navigateTo(context, 'home'),
              ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.redAccent,
              ),
              title: Text('Salir', style: TextStyle(color: Colors.red[600])),
              onTap: () => navigateTo(context, 'login'),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemsMenu {
  final IconData icon;
  final String title;
  final String? screen;
  final Color? color;

  ItemsMenu({required this.icon, required this.title, this.screen, this.color});
}
