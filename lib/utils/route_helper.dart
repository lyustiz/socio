import 'package:flutter/material.dart';

void pushScreen(BuildContext context, screen, [params]) {
  if (screen is Widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  } else {
    Navigator.pushNamed(context, screen, arguments: params);
  }
}

Future pushScreenData(BuildContext context, Widget screen) async {
  return await Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => screen),
  );
}

void navigateTo(BuildContext context, String route, [params]) {
  Navigator.pushReplacementNamed(context, route, arguments: params ?? {});
}
