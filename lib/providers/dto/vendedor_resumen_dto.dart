import 'package:socio/utils/db/json_serializer.dart';

class VendedorResumenDto {
  final int idVendedorResumen;
  final int idProgramacionJuego;
  final int idVendedor;
  final int totalCartones;
  final int cartonesCortesia;
  final double valorTotal;
  final double pagoAnticipado;
  final double valorPendiente;
  final int cartonesDevueltos;
  final int numeroHojasDevueltas;
  final double porcentajeComision;
  final int cobrado;
  final double faltante;
  final double gastoCortesia;
  final int cantidadModulos;
  final double valorModulos;
  final String estado;
  final String nombreVendedor;

  VendedorResumenDto(
      {required this.idVendedorResumen,
      required this.idProgramacionJuego,
      required this.idVendedor,
      required this.totalCartones,
      required this.cartonesCortesia,
      required this.valorTotal,
      required this.pagoAnticipado,
      required this.valorPendiente,
      required this.cartonesDevueltos,
      required this.numeroHojasDevueltas,
      required this.porcentajeComision,
      required this.cobrado,
      required this.faltante,
      required this.gastoCortesia,
      required this.cantidadModulos,
      required this.valorModulos,
      required this.estado,
      required this.nombreVendedor});

  factory VendedorResumenDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    return VendedorResumenDto(
      idVendedorResumen: serializer.fromJson<int>(json['idVendedorResumen']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      idVendedor: serializer.fromJson<int>(json['idVendedor']),
      totalCartones: serializer.fromJson<int>(json['totalCartones']),
      cartonesCortesia: serializer.fromJson<int>(json['cartonesCortesia']),
      valorTotal: serializer.fromJson<double>(json['valorTotal']),
      pagoAnticipado: serializer.fromJson<double>(json['pagoAnticipado']),
      valorPendiente: serializer.fromJson<double>(json['valorPendiente']),
      cartonesDevueltos: serializer.fromJson<int>(json['cartonesDevueltos']),
      numeroHojasDevueltas:
          serializer.fromJson<int>(json['numeroHojasDevueltas']),
      porcentajeComision:
          serializer.fromJson<double>(json['porcentajeComision']),
      cobrado: serializer.fromJson<int>(json['cobrado']),
      faltante: serializer.fromJson<double>(json['faltante']),
      gastoCortesia: serializer.fromJson<double>(json['gastoCortesia']),
      cantidadModulos: serializer.fromJson<int>(json['cantidadModulos']),
      valorModulos: serializer.fromJson<double>(json['valorModulos']),
      estado: serializer.fromJson<String>(json['estado']),
      nombreVendedor: serializer.fromJson<String>(json['nombreVendedor']),
    );
  }
}
