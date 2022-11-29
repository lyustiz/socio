import 'package:socio/utils/db/json_serializer.dart';

class AuditoriaAcumuladoDto {
  final int idAuditoria;
  final DateTime fechaAuditoria;
  final int idUsuario;
  final String usuario;
  final int idProgramacionJuego;
  final String tabla;
  final String accion;
  final String complemento;
  final int idPlenoAutomatico;
  final String figura;
  final int cartonAnterior;
  final int cartonNuevo;
  final String acumula;

  AuditoriaAcumuladoDto(
      {required this.idAuditoria,
      required this.fechaAuditoria,
      required this.idUsuario,
      required this.usuario,
      required this.idProgramacionJuego,
      required this.tabla,
      required this.accion,
      required this.complemento,
      required this.idPlenoAutomatico,
      required this.figura,
      required this.cartonAnterior,
      required this.cartonNuevo,
      required this.acumula});

  factory AuditoriaAcumuladoDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    return AuditoriaAcumuladoDto(
      idAuditoria: serializer.fromJson<int>(json['idAuditoria']),
      fechaAuditoria: serializer.fromJson<DateTime>(json['fechaAuditoria']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      usuario: serializer.fromJson<String>(json['usuario']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      tabla: serializer.fromJson<String>(json['tabla']),
      accion: serializer.fromJson<String>(json['accion']),
      complemento: serializer.fromJson<String>(json['complemento']),
      idPlenoAutomatico: serializer.fromJson<int>(json['idPlenoAutomatico']),
      figura: serializer.fromJson<String>(json['figura']),
      cartonAnterior: serializer.fromJson<int>(json['cartonAnterior']),
      cartonNuevo: serializer.fromJson<int>(json['cartonNuevo']),
      acumula: serializer.fromJson<String>(json['acumula']),
    );
  }
}
