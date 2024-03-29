import 'package:socio/providers/dto/resumen_juego_dto.dart';
import 'package:socio/providers/dto/socio_porcentaje_dto.dart';
import 'package:socio/utils/db/json_serializer.dart';

import 'gastos_generales_dto.dart';
import 'gastos_programacion_juego_dto.dart';
import 'ingresos_generales_dto.dart';
import 'ingresos_programacion_juego_dto.dart';

class InformeMensualDto {
  final int anio;
  final int mes;
  final double sumTotalPremios;
  final double sumAsistenciaSocial;
  final double sumIngresos;
  final double sumGastos;
  final double sumUtilidadFinal;
  final double sumIngresosJuego;
  final double sumGastosJuego;
  final double utilidadNeta;
  final double totalIngresos;
  final double totalGastos;
  final double totalAporteSocial;
  final double totalUtilidadFinal;
  final double totalSocios;
  final double totalEfectivo;
  final double totalBancos;
  final double totalDiferencia;
  final double cartonesVendidos;
  final double ventasTotales;
  final double beneficioNeto;
  final double sumVentasTotales;
  final double sumBeneficioNeto;
  final double sumComision;
  final List<int> listAnios;
  final List<int> listMeses;
  final List<ResumenJuegoDto> listaResumenJuegos;
  final List<GastosGeneralesDto> listaGastosGenerales;
  final List<IngresosGeneralesDto> listaIngresosGenerales;
  final List<GastosprogramacionjuegosDto> listaGastosJuego;
  final List<IngresosprogramacionjuegosDto> listaIngresosJuegos;
  final List<SocioPorcentajeDto> listaSocioPorcentaje;

  InformeMensualDto({
    required this.anio,
    required this.mes,
    required this.sumTotalPremios,
    required this.sumAsistenciaSocial,
    required this.sumIngresos,
    required this.sumGastos,
    required this.sumUtilidadFinal,
    required this.sumIngresosJuego,
    required this.sumGastosJuego,
    required this.utilidadNeta,
    required this.totalIngresos,
    required this.totalGastos,
    required this.totalAporteSocial,
    required this.totalUtilidadFinal,
    required this.totalSocios,
    required this.totalEfectivo,
    required this.totalBancos,
    required this.totalDiferencia,
    required this.cartonesVendidos,
    required this.ventasTotales,
    required this.beneficioNeto,
    required this.sumVentasTotales,
    required this.sumBeneficioNeto,
    required this.sumComision,
    required this.listAnios,
    required this.listMeses,
    required this.listaResumenJuegos,
    required this.listaGastosGenerales,
    required this.listaIngresosGenerales,
    required this.listaGastosJuego,
    required this.listaIngresosJuegos,
    required this.listaSocioPorcentaje,
  });

  factory InformeMensualDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    int year = DateTime.now().year;

    List<int> listAnios = [year - 1, year, year + 1];
    List<int> listMeses = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    List<ResumenJuegoDto> listaResumenJuegos = [];
    List<GastosGeneralesDto> listaGastosGenerales = [];
    List<IngresosGeneralesDto> listaIngresosGenerales = [];
    List<GastosprogramacionjuegosDto> listaGastosJuego = [];
    List<IngresosprogramacionjuegosDto> listaIngresosJuegos = [];
    List<SocioPorcentajeDto> listaSocioPorcentaje = [];

    for (var dataJson in (json['listaResumenJuegos'] as List)) {
      listaResumenJuegos.add(ResumenJuegoDto.fromJson(dataJson));
    }
    for (var dataJson in (json['listaGastosGenerales'] as List)) {
      listaGastosGenerales.add(GastosGeneralesDto.fromJson(dataJson));
    }
    for (var dataJson in (json['listaIngresosGenerales'] as List)) {
      listaIngresosGenerales.add(IngresosGeneralesDto.fromJson(dataJson));
    }
    for (var dataJson in (json['listaGastosJuego'] as List)) {
      listaGastosJuego.add(GastosprogramacionjuegosDto.fromJson(dataJson));
    }
    for (var dataJson in (json['listaIngresosJuegos'] as List)) {
      listaIngresosJuegos.add(IngresosprogramacionjuegosDto.fromJson(dataJson));
    }
    for (var dataJson in (json['listaSocioPorcentaje'] as List)) {
      listaSocioPorcentaje.add(SocioPorcentajeDto.fromJson(dataJson));
    }

    return InformeMensualDto(
      anio: serializer.fromJson<int>(json['anio']),
      mes: serializer.fromJson<int>(json['mes']),
      sumTotalPremios: serializer.fromJson<double>(json['sumTotalPremios']),
      sumAsistenciaSocial:
          serializer.fromJson<double>(json['sumAsistenciaSocial']),
      sumIngresos: serializer.fromJson<double>(json['sumIngresos']),
      sumGastos: serializer.fromJson<double>(json['sumGastos']),
      sumUtilidadFinal: serializer.fromJson<double>(json['sumUtilidadFinal']),
      sumIngresosJuego: serializer.fromJson<double>(json['sumIngresosJuego']),
      sumGastosJuego: serializer.fromJson<double>(json['sumGastosJuego']),
      utilidadNeta: serializer.fromJson<double>(json['utilidadNeta']),
      totalIngresos: serializer.fromJson<double>(json['totalIngresos']),
      totalGastos: serializer.fromJson<double>(json['totalGastos']),
      totalAporteSocial: serializer.fromJson<double>(json['totalAporteSocial']),
      totalUtilidadFinal:
          serializer.fromJson<double>(json['totalUtilidadFinal']),
      totalSocios: serializer.fromJson<double>(json['totalSocios']),
      totalEfectivo: serializer.fromJson<double>(json['totalEfectivo']),
      totalBancos: serializer.fromJson<double>(json['totalBancos']),
      totalDiferencia: serializer.fromJson<double>(json['totalDiferencia']),
      cartonesVendidos: serializer.fromJson<double>(json['cartonesVendidos']),
      ventasTotales: serializer.fromJson<double>(json['ventasTotales']),
      beneficioNeto: serializer.fromJson<double>(json['beneficioNeto']),
      sumVentasTotales: serializer.fromJson<double>(json['sumVentasTotales']),
      sumBeneficioNeto: serializer.fromJson<double>(json['sumBeneficioNeto']),
      sumComision: serializer.fromJson<double>(json['sumComision']),
      listAnios: listAnios,
      listMeses: listMeses,
      listaResumenJuegos: listaResumenJuegos,
      listaGastosGenerales: listaGastosGenerales,
      listaIngresosGenerales: listaIngresosGenerales,
      listaGastosJuego: listaGastosJuego,
      listaIngresosJuegos: listaIngresosJuegos,
      listaSocioPorcentaje: listaSocioPorcentaje,
    );
  }
}
