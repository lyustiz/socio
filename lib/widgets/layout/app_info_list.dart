import 'package:flutter/material.dart';

class AppInfoList extends StatelessWidget {
  final String title;
  final String text;

  const AppInfoList({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.05)),
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
