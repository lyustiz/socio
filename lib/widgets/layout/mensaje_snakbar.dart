import 'package:flutter/material.dart';

class MensajeSnackBar extends StatelessWidget {
  final String type;
  final String title;
  const MensajeSnackBar({Key? key, required this.type, required this.title})
      : super(key: key);

  @override
  SnackBar build(BuildContext context) {
    final Map<String, Color> mensajeColor = {
      'error': Colors.red,
      'warning': Colors.amber,
      'info': Colors.blue
    };
    final Map<String, IconData> mensajeIcono = {
      'error': Icons.error,
      'warning': Icons.warning,
      'info': Icons.info
    };

    return SnackBar(
        content: Row(children: [
      Icon(
        mensajeIcono[type],
        color: mensajeColor[type],
      ),
      Container(
        margin: EdgeInsets.only(left: 6),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ]));
  }
}
