import 'package:flutter/material.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/help/helper_global.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      icon: Icon(Icons.help),
      onPressed: () => pushScreen(context, HelperGlobal()),
    );
  }
}
