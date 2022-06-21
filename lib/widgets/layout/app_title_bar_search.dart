import 'package:flutter/material.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/help/helper_screen.dart';

class AppTitleBarSearch extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget title;
  final String? helpScreen;
  final Widget? leading;
  AppTitleBarSearch(
      {Key? key, required this.title, this.helpScreen, this.leading})
      : preferredSize = Size.fromHeight(70.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 5),
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(27, 113, 186, 1),
              Color.fromRGBO(149, 26, 130, 1),
            ],
          )),
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
                this.title,
                Positioned(
                  right: 0,
                  top: 3,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: Colors.white, width: 3),
                        color: Theme.of(context).colorScheme.secondary),
                    child: GestureDetector(
                      onTap: () => _onHelpScreen(context),
                      child: Text(
                        '?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          //Icono de Menu
          Container(
            child: IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.more_vert, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  _onHelpScreen(context) {
    if (this.helpScreen != null) {
      pushScreen(
          context,
          HelperScreen(
            screen: this.helpScreen,
          ));
    }
  }
}
