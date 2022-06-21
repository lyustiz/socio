import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonIcon({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(56, 56), // button width and height
      child: ClipOval(
        child: Material(
          color: Colors.green, // button color
          child: InkWell(
            splashColor: Colors.lightGreen, // splash color
            onTap: () => onPressed, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.call, color: Colors.white), // icon
                Text("Call"), // text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
