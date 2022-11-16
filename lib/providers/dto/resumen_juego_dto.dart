import 'package:socio/utils/db/json_serializer.dart';

class ResumenJuegoDto {
  final int idProgramacionJuego;
  final DateTime fechaProgramada;
  final double valorCarton;
  final double valorModulo;
  final double totalPremios;
  final String serie;
  final int cartonInicial;
  final int cartonFinal;
  final double asistenciaSocial;
  final double ingresos;
  final double gastos;
  final double cartonesVendidos;
  final double ventasTotales;
  final double beneficioNeto;
  final double comision;
  final double utilidadFinal;

  ResumenJuegoDto(
      {required this.idProgramacionJuego,
      required this.fechaProgramada,
      required this.valorCarton,
      required this.valorModulo,
      required this.totalPremios,
      required this.serie,
      required this.cartonInicial,
      required this.cartonFinal,
      required this.asistenciaSocial,
      required this.ingresos,
      required this.gastos,
      required this.cartonesVendidos,
      required this.ventasTotales,
      required this.beneficioNeto,
      required this.comision,
      required this.utilidadFinal});

  factory ResumenJuegoDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return ResumenJuegoDto(
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      fechaProgramada: serializer.fromJson<DateTime>(json['fechaProgramada']),
      valorCarton: serializer.fromJson<double>(json['valorCarton']),
      valorModulo: serializer.fromJson<double>(json['valorModulo']),
      totalPremios: serializer.fromJson<double>(json['totalPremios']),
      serie: serializer.fromJson<String>(json['serie']),
      cartonInicial: serializer.fromJson<int>(json['cartonInicial']),
      cartonFinal: serializer.fromJson<int>(json['cartonFinal']),
      asistenciaSocial: serializer.fromJson<double>(json['asistenciaSocial']),
      ingresos: serializer.fromJson<double>(json['ingresos']),
      gastos: serializer.fromJson<double>(json['gastos']),
      cartonesVendidos: serializer.fromJson<double>(json['cartonesVendidos']),
      ventasTotales: serializer.fromJson<double>(json['ventasTotales']),
      beneficioNeto: serializer.fromJson<double>(json['beneficioNeto']),
      comision: serializer.fromJson<double>(json['comision']),
      utilidadFinal: serializer.fromJson<double>(json['utilidadFinal']),
    );
  }
}
