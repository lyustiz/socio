import 'package:socio/providers/dto/vendedores_promedio_ventas_dto.dart';
import 'package:socio/utils/db/json_serializer.dart';

class InformePromedioVentasDto {
  final DateTime fechaInicial;
  final DateTime fechaFinal;
  final int sumTotalCartones;
  final int sumCartonesDevueltos;
  final int sumCartonesCortesia;
  final int sumCartonesVendidos;
  final double sumTotalVentas;
  final double sumTotalComision;
  final double sumTotalPagado;

  final List<VendedoresPromedioVentasDto> listaVendedoresPromedioVentas;

  InformePromedioVentasDto(
      {required this.fechaInicial,
      required this.fechaFinal,
      required this.sumTotalCartones,
      required this.sumCartonesDevueltos,
      required this.sumCartonesCortesia,
      required this.sumCartonesVendidos,
      required this.sumTotalVentas,
      required this.sumTotalComision,
      required this.sumTotalPagado,
      required this.listaVendedoresPromedioVentas});

  factory InformePromedioVentasDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    int year = DateTime.now().year;

    List<VendedoresPromedioVentasDto> listaVendedoresPromedioVentas = [];

    for (var dataJson in (json['listaVendedoresPromedioVentas'] as List)) {
      listaVendedoresPromedioVentas
          .add(VendedoresPromedioVentasDto.fromJson(dataJson));
    }

    return InformePromedioVentasDto(
        fechaInicial: serializer.fromJson<DateTime>(json['fechaInicial']),
        fechaFinal: serializer.fromJson<DateTime>(json['fechaFinal']),
        sumTotalCartones: serializer.fromJson<int>(json['sumTotalCartones']),
        sumCartonesDevueltos:
            serializer.fromJson<int>(json['sumCartonesDevueltos']),
        sumCartonesCortesia:
            serializer.fromJson<int>(json['sumCartonesCortesia']),
        sumCartonesVendidos:
            serializer.fromJson<int>(json['sumCartonesVendidos']),
        sumTotalVentas: serializer.fromJson<double>(json['sumTotalVentas']),
        sumTotalComision: serializer.fromJson<double>(json['sumTotalComision']),
        sumTotalPagado: serializer.fromJson<double>(json['sumTotalPagado']),
        listaVendedoresPromedioVentas: listaVendedoresPromedioVentas);
  }
}
