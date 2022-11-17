import 'package:socio/utils/db/json_serializer.dart';

class VendedoresPromedioVentasDto {
  final int idVendedor;
  final String nombreCompleto;
  final int totalCartones;
  final int cartonesDevueltos;
  final int cartonesCortesia;
  final int cartonesVendidos;
  final double totalVentas;
  final double totalComision;
  final double totalPagado;

  VendedoresPromedioVentasDto({
    required this.idVendedor,
    required this.nombreCompleto,
    required this.totalCartones,
    required this.cartonesDevueltos,
    required this.cartonesCortesia,
    required this.cartonesVendidos,
    required this.totalVentas,
    required this.totalComision,
    required this.totalPagado,
  });

  factory VendedoresPromedioVentasDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return VendedoresPromedioVentasDto(
      idVendedor: serializer.fromJson<int>(json['idVendedor']),
      nombreCompleto: serializer.fromJson<String>(json['nombreCompleto']),
      totalCartones: serializer.fromJson<int>(json['totalCartones']),
      cartonesDevueltos: serializer.fromJson<int>(json['cartonesDevueltos']),
      cartonesCortesia: serializer.fromJson<int>(json['cartonesCortesia']),
      cartonesVendidos: serializer.fromJson<int>(json['cartonesVendidos']),
      totalVentas: serializer.fromJson<double>(json['totalVentas']),
      totalComision: serializer.fromJson<double>(json['totalComision']),
      totalPagado: serializer.fromJson<double>(json['totalPagado']),
    );
  }
}
