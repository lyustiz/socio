import 'package:socio/utils/db/json_serializer.dart';

class IngresosprogramacionjuegosDto {
  final int idIngresoJuego;
  final int idProgramacionJuego;
  final DateTime fechaHora;
  final int idUsuario;
  final int idConceptoIngreso;
  final String nombre;
  final String descripcion;
  final double valor;
  final String socio;
  final String estado;

  IngresosprogramacionjuegosDto(
      {required this.idIngresoJuego,
      required this.idProgramacionJuego,
      required this.fechaHora,
      required this.idUsuario,
      required this.idConceptoIngreso,
      required this.nombre,
      required this.descripcion,
      required this.valor,
      required this.socio,
      required this.estado});

  factory IngresosprogramacionjuegosDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return IngresosprogramacionjuegosDto(
      idIngresoJuego: serializer.fromJson<int>(json['idGastoJuego']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      fechaHora: serializer.fromJson<DateTime>(json['fechaHora']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      idConceptoIngreso: serializer.fromJson<int>(json['idConceptoGasto']),
      nombre: serializer.fromJson<String>(json['nombre']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      valor: serializer.fromJson<double>(json['valor']),
      socio: serializer.fromJson<String>(json['socio']),
      estado: serializer.fromJson<String>(json['estado']),
    );
  }
}
