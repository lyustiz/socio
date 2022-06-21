import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double radius;
  final Color color;
  final IconData icon;
  const AppIcon(
      {Key? key,
      this.radius = 40,
      this.color = Colors.red,
      this.icon = Icons.help})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: Colors.white, width: 2),
            color: color),
        child: Icon(icon, size: 28));
  }
}
