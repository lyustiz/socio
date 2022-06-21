import 'package:flutter/material.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/help/helper_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final String? helpScreen;
  final Widget? leading;

  CustomAppBar({Key? key, required this.title, this.helpScreen, this.leading})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //leading
        Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          child: this.leading,
        ),
        //Titulo e Icono de Ayuda
        Expanded(
          child: Container(
              margin: EdgeInsets.only(top: 8, bottom: 6),
              child: Stack(clipBehavior: Clip.none, children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 8, right: 47),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(30)),
                      border: Border.all(color: Colors.white, width: 2),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.secondaryVariant,
                        ],
                      )),
                  child: Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 60,
                    height: 60,
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
                            fontSize: 46,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ])),
        ),
        //Icono de Menu
        Container(
          child: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ),
      ],
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
