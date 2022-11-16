import 'package:socio/providers/dto/usuario_dto.dart';
import 'package:socio/providers/dto/vendedor_cobro_carton_dto.dart';
import 'package:socio/utils/db/json_serializer.dart';

import 'gastos_programacion_juego_dto.dart';
import 'ingresos_programacion_juego_dto.dart';

class InformeCajaUsuarioDto {
  final int numeroJuego;
  final int idUsuario;
  final String nombreUsuario;
  final int sumTotalCartones;
  final int sumCartonesCortesia;
  final double sumTotalModulos;
  final int sumCartonesDevueltos;
  final double sumValorComision;
  final double sumTotalVentas;
  final double sumFaltante;
  final double sumGastoCortesia;
  final double sumTotalRecibido;
  final int sumVentaTotalCartones;
  final double totalFaltante;
  final double totalFacturado;
  final double totalRecaudo;
  final double totalGastos;
  final double totalIngresos;
  final double totalEntregado;
  final double totalCalculado;
  final double totalDiferencia;
  final double totalRecaudosFaltantes;
  final List<UsuarioDto> listaUsuarios;
  final List<VendedorCobrocartonDto> listaVendedoresCobrocartones;
  final List<GastosprogramacionjuegosDto> listaGastosJuego;
  final List<IngresosprogramacionjuegosDto> listaIngresosJuego;

  InformeCajaUsuarioDto(
      {required this.numeroJuego,
      required this.idUsuario,
      required this.nombreUsuario,
      required this.sumTotalCartones,
      required this.sumCartonesCortesia,
      required this.sumTotalModulos,
      required this.sumCartonesDevueltos,
      required this.sumValorComision,
      required this.sumTotalVentas,
      required this.sumFaltante,
      required this.sumGastoCortesia,
      required this.sumTotalRecibido,
      required this.sumVentaTotalCartones,
      required this.totalFaltante,
      required this.totalFacturado,
      required this.totalRecaudo,
      required this.totalGastos,
      required this.totalIngresos,
      required this.totalEntregado,
      required this.totalCalculado,
      required this.totalDiferencia,
      required this.totalRecaudosFaltantes,
      required this.listaUsuarios,
      required this.listaVendedoresCobrocartones,
      required this.listaGastosJuego,
      required this.listaIngresosJuego});

  factory InformeCajaUsuarioDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    List<UsuarioDto> listaUsuarios = [];
    List<VendedorCobrocartonDto> listaVendedoresCobrocartones = [];
    List<GastosprogramacionjuegosDto> listaGastosJuego = [];
    List<IngresosprogramacionjuegosDto> listaIngresosJuego = [];

    for (var usuariosJson in (json['listaUsuarios'] as List)) {
      listaUsuarios.add(UsuarioDto.fromJson(usuariosJson));
    }
    for (var vendedoresCobrocartonesJson
        in (json['listaVendedoresCobrocartones'] as List)) {
      listaVendedoresCobrocartones
          .add(VendedorCobrocartonDto.fromJson(vendedoresCobrocartonesJson));
    }
    for (var gastosJuegoJson in (json['listaGastosJuego'] as List)) {
      listaGastosJuego
          .add(GastosprogramacionjuegosDto.fromJson(gastosJuegoJson));
    }
    for (var ingresosJuegoJson in (json['listaIngresosJuego'] as List)) {
      listaIngresosJuego
          .add(IngresosprogramacionjuegosDto.fromJson(ingresosJuegoJson));
    }

    return InformeCajaUsuarioDto(
      numeroJuego: serializer.fromJson<int>(json['numeroJuego']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      nombreUsuario: serializer.fromJson<String>(json['nombreUsuario']),
      sumTotalCartones: serializer.fromJson<int>(json['sumTotalCartones']),
      sumCartonesCortesia:
          serializer.fromJson<int>(json['sumCartonesCortesia']),
      sumTotalModulos: serializer.fromJson<double>(json['sumTotalModulos']),
      sumCartonesDevueltos:
          serializer.fromJson<int>(json['sumCartonesDevueltos']),
      sumValorComision: serializer.fromJson<double>(json['sumValorComision']),
      sumTotalVentas: serializer.fromJson<double>(json['sumTotalVentas']),
      sumFaltante: serializer.fromJson<double>(json['sumFaltante']),
      sumGastoCortesia: serializer.fromJson<double>(json['sumGastoCortesia']),
      sumTotalRecibido: serializer.fromJson<double>(json['sumTotalRecibido']),
      sumVentaTotalCartones:
          serializer.fromJson<int>(json['sumVentaTotalCartones']),
      totalFaltante: serializer.fromJson<double>(json['totalFaltante']),
      totalFacturado: serializer.fromJson<double>(json['totalFacturado']),
      totalRecaudo: serializer.fromJson<double>(json['totalRecaudo']),
      totalGastos: serializer.fromJson<double>(json['totalGastos']),
      totalIngresos: serializer.fromJson<double>(json['totalIngresos']),
      totalEntregado: serializer.fromJson<double>(json['totalEntregado']),
      totalCalculado: serializer.fromJson<double>(json['totalCalculado']),
      totalDiferencia: serializer.fromJson<double>(json['totalDiferencia']),
      totalRecaudosFaltantes:
          serializer.fromJson<double>(json['totalRecaudosFaltantes']),
      listaUsuarios: listaUsuarios,
      listaVendedoresCobrocartones: listaVendedoresCobrocartones,
      listaGastosJuego: listaGastosJuego,
      listaIngresosJuego: listaIngresosJuego,
    );
  }
}
