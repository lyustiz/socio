import 'package:socio/models/recaudos_totales.dart';
import 'package:socio/utils/db/json_serializer.dart';

class RecaudosTotalesDto {
  final int idRecaudoTotal;
  final int idProgramacionJuego;
  final int idUsuario;
  final String nombreUsuario;
  final double recuadoTotal;
  final String estado;
  final double valorRecaudoCalculado;
  final double diferencia;
  final int incluirGastosGenerales;
  final double gastos;
  final double ingresos;
  final double registroGastos;
  final double registroIngresos;
  final double totalGrupoSuma1;
  final double totalGrupoSuma2;

  RecaudosTotalesDto({
    required this.idRecaudoTotal,
    required this.idProgramacionJuego,
    required this.idUsuario,
    required this.nombreUsuario,
    required this.recuadoTotal,
    required this.estado,
    required this.valorRecaudoCalculado,
    required this.diferencia,
    required this.incluirGastosGenerales,
    required this.gastos,
    required this.ingresos,
    required this.registroGastos,
    required this.registroIngresos,
    required this.totalGrupoSuma1,
    required this.totalGrupoSuma2,
  });

  factory RecaudosTotalesDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    return RecaudosTotalesDto(
      idRecaudoTotal: serializer.fromJson<int>(json['idRecaudoTotal']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      nombreUsuario: serializer.fromJson<String>(json['nombreUsuario']),
      recuadoTotal: serializer.fromJson<double>(json['recuadoTotal']),
      estado: serializer.fromJson<String>(json['estado']),
      valorRecaudoCalculado:
          serializer.fromJson<double>(json['valorRecaudoCalculado']),
      diferencia: serializer.fromJson<double>(json['diferencia']),
      incluirGastosGenerales:
          serializer.fromJson<int>(json['incluirGastosGenerales']),
      gastos: serializer.fromJson<double>(json['gastos']),
      ingresos: serializer.fromJson<double>(json['ingresos']),
      registroGastos: serializer.fromJson<double>(json['registroGastos']),
      registroIngresos: serializer.fromJson<double>(json['registroIngresos']),
      totalGrupoSuma1: serializer.fromJson<double>(json['totalGrupoSuma1']),
      totalGrupoSuma2: serializer.fromJson<double>(json['totalGrupoSuma2']),
    );
  }

  static RecaudosTotales toRecaudosTotales(
      RecaudosTotalesDto recaudosTotalesDto) {
    return RecaudosTotales(
      idRecaudoTotal: recaudosTotalesDto.idRecaudoTotal,
      idProgramacionJuego: recaudosTotalesDto.idProgramacionJuego,
      idUsuario: recaudosTotalesDto.idUsuario,
      recuadoTotal: recaudosTotalesDto.recuadoTotal,
      estado: recaudosTotalesDto.estado,
      valorRecaudoCalculado: recaudosTotalesDto.valorRecaudoCalculado,
      diferencia: recaudosTotalesDto.diferencia,
      incluirGastosGenerales: recaudosTotalesDto.incluirGastosGenerales,
      gastos: recaudosTotalesDto.gastos,
      ingresos: recaudosTotalesDto.ingresos,
      registroGastos: recaudosTotalesDto.registroGastos,
      registroIngresos: recaudosTotalesDto.registroIngresos,
      totalGrupoSuma1: recaudosTotalesDto.totalGrupoSuma1,
      totalGrupoSuma2: recaudosTotalesDto.totalGrupoSuma2,
    );
  }
}
