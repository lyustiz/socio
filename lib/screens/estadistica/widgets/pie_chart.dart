import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  const PieChart(
      {Key? key,
      required this.radio,
      required this.value,
      required this.total,
      this.colorValue = Colors.green,
      this.colorTotal = Colors.red})
      : super(key: key);

  final double radio;
  final int value;
  final int total;
  final Color colorValue;
  final Color colorTotal;

  @override
  Widget build(BuildContext context) {
    final double percent = (total == 0) ? 0 : (value / total);
    return SizedBox(
      height: this.radio,
      width: this.radio,
      child: Stack(alignment: Alignment.center, children: [
        SizedBox(
          height: this.radio,
          width: this.radio,
          child: CircularProgressIndicator(
            value: percent,
            strokeWidth: 20,
            valueColor: AlwaysStoppedAnimation<Color>(colorValue),
            semanticsLabel: 'Cartones Vendidos',
            backgroundColor: colorTotal,
          ),
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: '${this.value.toInt()}',
                  style: TextStyle(color: colorValue)),
              TextSpan(
                  text: '/', style: TextStyle(fontSize: 18, color: colorTotal)),
              TextSpan(
                  text: '${this.total.toInt()}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: colorTotal)),
            ],
          ),
        )
      ]),
    );
  }
}
