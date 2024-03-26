import 'package:flutter/material.dart';

SnackBar appMessage(BuildContext context, String type, String message) {
  Map<String, Color> color = {
    'info': Colors.blueAccent,
    'success': Colors.green,
    'warning': Colors.amber,
    'error': Colors.redAccent,
  };

  Map<String, IconData> icon = {
    'info': Icons.info_outline,
    'success': Icons.check_circle_outline,
    'warning': Icons.warning_outlined,
    'error': Icons.error_outline,
  };

  return SnackBar(
    duration: Duration(milliseconds: 1200),
    content: Row(children: [
      Icon(
        icon[type] ?? icon['success'],
        color: Colors.white,
      ),
      Container(
        margin: EdgeInsets.only(left: 6),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ]),
    backgroundColor: color[type] ?? color['success'],
  );
}
