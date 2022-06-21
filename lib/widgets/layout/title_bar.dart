import 'package:flutter/material.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/help/helper_screen.dart';

class titleBar extends StatelessWidget implements PreferredSize {
  final String title;
  final Widget? leading;
  final String? helpScreen;
  const titleBar(
      {Key? key, required title, Widget? leading, String? helpScreen})
      : this.title = title,
        this.leading = leading,
        this.helpScreen = helpScreen,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      centerTitle: true,
      title: Stack(children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
      ]),
      actions: [
        IconButton(
          onPressed: () => _onHelpScreen(context),
          icon: Icon(Icons.help, color: Colors.white),
        ),
        IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(Icons.more_vert, color: Colors.white),
        ),
      ],
      leading: leading,
    );
  }

  @override
  Widget get child => throw UnimplementedError('joda');

  @override
  Size get preferredSize => Size.fromHeight(70);

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
