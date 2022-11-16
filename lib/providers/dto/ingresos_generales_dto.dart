import 'package:socio/utils/db/json_serializer.dart';

class IngresosGeneralesDto {
  final int idIngresoGeneral;
  final int idUsuario;
  final int idConceptoIngreso;
  final String descripcion;
  final double valor;
  final String socio;
  final DateTime fechaRegistro;
  final int mes;
  final int anio;
  final String origenPago;
  final String estado;

  IngresosGeneralesDto({
    required this.idIngresoGeneral,
    required this.idUsuario,
    required this.idConceptoIngreso,
    required this.descripcion,
    required this.valor,
    required this.socio,
    required this.fechaRegistro,
    required this.mes,
    required this.anio,
    required this.origenPago,
    required this.estado,
  });

  factory IngresosGeneralesDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return IngresosGeneralesDto(
      idIngresoGeneral: serializer.fromJson<int>(json['idIngresoGeneral']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      idConceptoIngreso: serializer.fromJson<int>(json['idConceptoIngreso']),
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
