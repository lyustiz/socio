import 'package:socio/utils/db/json_serializer.dart';

class AuditoriaConfiguracionDto {
  final int idAuditoria;
  final DateTime fechaAuditoria;
  final int idUsuario;
  final String usuario;
  final int idProgramacionJuego;
  final String tabla;
  final String accion;
  final String complemento;
  final int cartonAnterior;
  final int cartonNuevo;
  final int balotaAnterior;
  final int balotaNuevo;
  final int dualAnterior;
  final int dualNuevo;
  final String clienteAnterior;
  final String clienteNuevo;
  final String multipleAnterior;
  final String multipleNuevo;

  AuditoriaConfiguracionDto({
    required this.idAuditoria,
    required this.fechaAuditoria,
    required this.idUsuario,
    required this.usuario,
    required this.idProgramacionJuego,
    required this.tabla,
    required this.accion,
    required this.complemento,
    required this.cartonAnterior,
    required this.cartonNuevo,
    required this.balotaAnterior,
    required this.balotaNuevo,
    required this.dualAnterior,
    required this.dualNuevo,
    required this.clienteAnterior,
    required this.clienteNuevo,
    required this.multipleAnterior,
    required this.multipleNuevo,
  });

  factory AuditoriaConfiguracionDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    return AuditoriaConfiguracionDto(
      idAuditoria: serializer.fromJson<int>(json['idAuditoria']),
      fechaAuditoria: serializer.fromJson<DateTime>(json['fechaAuditoria']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      usuario: serializer.fromJson<String>(json['usuario']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      tabla: serializer.fromJson<String>(json['tabla']),
      accion: serializer.fromJson<String>(json['accion']),
      complemento: serializer.fromJson<String>(json['complemento']),
      cartonAnterior: serializer.fromJson<int>(json['cartonAnterior']),
      cartonNuevo: serializer.fromJson<int>(json['cartonNuevo']),
      dualAnterior: serializer.fromJson<int>(json['dualAnterior']),
      dualNuevo: serializer.fromJson<int>(json['dualNuevo']),
      balotaAnterior: serializer.fromJson<int>(json['balotaAnterior']),
      balotaNuevo: serializer.fromJson<int>(json['balotaNuevo']),
      clienteAnterior: serializer.fromJson<String>(json['clienteAnterior']),
      clienteNuevo: serializer.fromJson<String>(json['clienteNuevo']),
      multipleAnterior: serializer.fromJson<String>(json['multipleAnterior']),
      multipleNuevo: serializer.fromJson<String>(json['multipleNuevo']),
    );
  }
}
