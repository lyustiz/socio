import 'package:socio/utils/db/json_serializer.dart';

class SocioPorcentajeDto {
  final String nombreCompleto;
  final double procentaje;
  final double monto;
  final double anticipos;
  final double total;

  SocioPorcentajeDto({
    required this.nombreCompleto,
    required this.procentaje,
    required this.monto,
    required this.anticipos,
    required this.total,
  });

  factory SocioPorcentajeDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return SocioPorcentajeDto(
      nombreCompleto: serializer.fromJson<String>(json['nombreCompleto']),
      procentaje: serializer.fromJson<double>(json['procentaje']),
      monto: serializer.fromJson<double>(json['monto']),
      anticipos: serializer.fromJson<double>(json['anticipos']),
      total: serializer.fromJson<double>(json['total']),
    );
  }
}
