import 'package:flutter/material.dart';

class HelpIcon extends StatelessWidget {
  final double radius;
  const HelpIcon({Key? key, this.radius = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: Colors.white, width: 3),
            color: Theme.of(context).colorScheme.secondary),
        child: Text(
          '?',
          style: TextStyle(
              color: Colors.white,
              fontSize: this.radius - 10,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));
  }
}
