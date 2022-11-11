import 'package:flutter/material.dart';
import 'package:socio/utils/db/db_manager.dart';

class JuegoIcon extends StatelessWidget {
  final Juego juego;
  const JuegoIcon({Key? key, required this.juego}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String statusIcon = (juego.idJuego == null) ? juego.estado : 'F';

    Map<String, IconData> itemIcon = {
      'A': Icons.power_settings_new_sharp,
      'C': Icons.power_settings_new_sharp,
      'F': Icons.lock,
    };

    Map<String, Color> itemColor = {
      'A': Colors.lightGreen,
      'C': Colors.orange,
      'F': Colors.redAccent,
    };

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(30),
          color: itemColor[statusIcon]),
      child: Icon(
        itemIcon[statusIcon],
        color: Colors.white,
        size: 45,
      ),
    );
  }
}
