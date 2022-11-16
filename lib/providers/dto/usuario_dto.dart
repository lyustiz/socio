import 'package:socio/utils/db/json_serializer.dart';

class UsuarioDto {
  final int idUsuario;
  final String nombreCompleto;

  UsuarioDto({required this.idUsuario, required this.nombreCompleto});

  factory UsuarioDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return UsuarioDto(
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      nombreCompleto: serializer.fromJson<String>(json['nombreCompleto']),
    );
  }
}
