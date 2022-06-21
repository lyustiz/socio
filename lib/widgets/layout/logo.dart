import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;
  final double fontSize;

  const Logo({Key? key, required this.titulo, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/icons/logo.png'),
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              this.titulo,
              style: TextStyle(
                  fontSize: this.fontSize,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
