import 'package:socio/utils/db/json_serializer.dart';

class GastosGeneralesDto {
  final int idGastoGeneral;
  final int idUsuario;
  final int idConceptoGasto;
  final String descripcion;
  final double valor;
  final String socio;
  final DateTime fechaRegistro;
  final int mes;
  final int anio;
  final String origenPago;
  final String estado;

  GastosGeneralesDto({
    required this.idGastoGeneral,
    required this.idUsuario,
    required this.idConceptoGasto,
    required this.descripcion,
    required this.valor,
    required this.socio,
    required this.fechaRegistro,
    required this.mes,
    required this.anio,
    required this.origenPago,
    required this.estado,
  });

  factory GastosGeneralesDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return GastosGeneralesDto(
      idGastoGeneral: serializer.fromJson<int>(json['idGastoGeneral']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      idConceptoGasto: serializer.fromJson<int>(json['idConceptoGasto']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      valor: serializer.fromJson<double>(json['valor']),
      socio: serializer.fromJson<String>(json['socio']),
      fechaRegistro: serializer.fromJson<DateTime>(json['fechaRegistro']),
      mes: serializer.fromJson<int>(json['mes']),
      anio: serializer.fromJson<int>(json['anio']),
      origenPago: serializer.fromJson<String>(json['origenPago']),
      estado: serializer.fromJson<String>(json['estado']),
    );
  }
}
