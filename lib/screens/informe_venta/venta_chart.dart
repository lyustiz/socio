import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:socio/providers/dto/vendedores_promedio_ventas_dto.dart';
import 'package:socio/screens/informe_venta/widgets/indicador.dart';

class VentaChart extends StatefulWidget {
  VentaChart(this.vendedores);

  final List<VendedoresPromedioVentasDto> vendedores;
  late List<_BarData> dataList = [];

  static const List<Color> colors = [
    Color(0xFFecb206),
    Color(0xFFa8bd1a),
    Color(0xFF17987b),
    Color(0xFF295ab5),
    Color(0xFFb87d46)
  ];

  @override
  State<VentaChart> createState() => _VentaChartState();
}

class _VentaChartState extends State<VentaChart> {
  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double total,
    double vendidos,
    double devueltos,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: total,
          color: Colors.blueAccent,
          width: 10,
        ),
        BarChartRodData(
          toY: vendidos,
          color: Colors.greenAccent,
          width: 10,
        ),
        BarChartRodData(
          toY: devueltos,
          color: const Color(0xFFea0107),
          width: 10,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    int idxColor = -1;
    num maxY = 10;
    List<_BarData> dataList = widget.vendedores.take(5).map((v) {
      idxColor++;
      maxY = (maxY > v.totalCartones) ? maxY : v.totalCartones;
      return _BarData(VentaChart.colors[idxColor], v.totalCartones,
          v.cartonesVendidos, v.cartonesDevueltos);
    }).toList();

    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leyenda(),
            AspectRatio(
              aspectRatio: 1.4,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceBetween,
                  borderData: FlBorderData(
                    show: true,
                    border: const Border.symmetric(
                      horizontal: BorderSide(
                        color: Color(0xFFececec),
                      ),
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      drawBehindEverything: true,
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Color(0xFF606060),
                            ),
                            textAlign: TextAlign.left,
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 36,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: _IconWidget(
                              color: dataList[index].color,
                              isSelected: touchedGroupIndex == index,
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(),
                    topTitles: AxisTitles(),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: const Color(0xFFececec),
                      strokeWidth: 1,
                    ),
                  ),
                  barGroups: dataList.asMap().entries.map((e) {
                    final index = e.key;
                    final data = e.value;
                    return generateBarGroup(
                      index,
                      data.color,
                      data.total.toDouble(),
                      data.vendidos.toDouble(),
                      data.devueltos.toDouble(),
                    );
                  }).toList(),
                  maxY: maxY.toDouble(),
                  barTouchData: BarTouchData(
                    enabled: true,
                    handleBuiltInTouches: false,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.transparent,
                      tooltipMargin: 0,
                      getTooltipItem: (
                        BarChartGroupData group,
                        int groupIndex,
                        BarChartRodData rod,
                        int rodIndex,
                      ) {
                        return BarTooltipItem(
                          rod.toY.toString(),
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            color: rod.color,
                            fontSize: 18,
                            shadows: const [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 12,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    touchCallback: (event, response) {
                      if (event.isInterestedForInteractions &&
                          response != null &&
                          response.spot != null) {
                        setState(() {
                          touchedGroupIndex =
                              response.spot!.touchedBarGroupIndex;
                        });
                      } else {
                        setState(() {
                          touchedGroupIndex = -1;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(top: 5),
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  var vendedor = widget.vendedores[index];
                  return Indicator(
                    color: VentaChart.colors[index],
                    text:
                        '${index + 1} - ${vendedor.nombreCompleto.toLowerCase()}',
                    isSquare: true,
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget leyenda() {
    double size = 15;
    return Container(
      margin: const EdgeInsets.only(left: 1, right: 1, bottom: 10, top: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueAccent,
            ),
          ),
          const Text(
            'Total',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.greenAccent,
            ),
          ),
          const Text(
            'Vendidos',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.redAccent,
            ),
          ),
          const Text(
            'Devueltos',
            style: TextStyle(fontSize: 14, color: Colors.black),
          )
        ],
      ),
    );
  }
}

class _BarData {
  const _BarData(this.color, this.total, this.vendidos, this.devueltos);
  final Color color;
  final int total;
  final int vendidos;
  final int devueltos;
}

class _IconWidget extends ImplicitlyAnimatedWidget {
  const _IconWidget({
    required this.color,
    required this.isSelected,
  }) : super(duration: const Duration(milliseconds: 300));
  final Color color;
  final bool isSelected;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _IconWidgetState();
}

class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
  Tween<double>? _rotationTween;

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    return Transform(
      transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
      origin: const Offset(14, 14),
      child: Icon(
        widget.isSelected ? Icons.face_retouching_natural : Icons.face,
        color: widget.color,
        size: 28,
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value as double,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>?;
  }
}
