import 'package:flutter/material.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/help/helper_screen.dart';

class AppTitleBarVariant extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final String? helpScreen;
  final Widget? leading;
  final String? color;
  AppTitleBarVariant({
    Key? key,
    required this.title,
    this.helpScreen,
    this.leading,
    this.color = 'purple',
  })  : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, BoxDecoration> background = {
      'purple': BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.secondaryVariant,
            ],
          )),
      'white': BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
    };

    Map<String, Color> colorVariant = {
      'purple': Colors.white,
      'white': Theme.of(context).colorScheme.primary,
    };

    return Container(
      margin: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 1),
      height: 45,
      decoration: background[color],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //leading
          Container(
            child: this.leading ??
                SizedBox(
                  height: 20,
                  width: 35,
                ),
          ),
          //Titulo e Icono de Ayuda
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colorVariant[color],
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                _hasHelpScreen(context)
              ],
            ),
          ),
          //Icono de Menu
          Container(
            child: IconButton(
              tooltip: "menu",
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.more_vert, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hasHelpScreen(context) {
    if (this.helpScreen != null) {
      return Positioned(
        right: 0,
        top: -11,
        child: AppHelpIcon(helpScreen: helpScreen),
      );
    }
    return Text('');
  }
}

class AppHelpIcon extends StatelessWidget {
  const AppHelpIcon({
    Key? key,
    required this.helpScreen,
  }) : super(key: key);

  final String? helpScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: Colors.white, width: 3),
            color: Theme.of(context).colorScheme.secondary),
        child: GestureDetector(
          onTap: () => pushScreen(
              context,
              HelperScreen(
                screen: this.helpScreen,
              )),
          child: Text(
            '?',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
