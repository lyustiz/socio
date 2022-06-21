import 'package:socio/utils/db/json_serializer.dart';

class FiguraDto {
  final int idFigura; //: 6,
  final int idPlenoAutomatico; //: 56,
  final String nombre;
  final String posiciones; //: 2 Esquinas 1,
  final String estado; //: A,
  final int valorPremio;
  final String acumula; //: 100
  final DateTime? fechaAjuste;
  final int? idUsuario;

  FiguraDto(
      {required this.idFigura,
      required this.idPlenoAutomatico,
      required this.nombre,
      required this.posiciones,
      required this.estado,
      required this.valorPremio,
      required this.acumula,
      this.fechaAjuste,
      this.idUsuario});

  factory FiguraDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    var fechaAjuste = json['fechaAjuste'] != null
        ? DateTime.parse(json['fechaAjuste'])
        : null;

    return FiguraDto(
      idFigura: serializer.fromJson<int>(json['idFigura']),
      idPlenoAutomatico: serializer.fromJson<int>(json['idPlenoAutomatico']),
      nombre: serializer.fromJson<String>(json['nombre']),
      posiciones: serializer.fromJson<String>(json['posiciones']),
      estado: serializer.fromJson<String>(json['estado']),
      valorPremio: serializer.fromJson<int>(json['valorPremio']),
      acumula: serializer.fromJson<String>(json['acumula']),
      fechaAjuste: fechaAjuste,
      idUsuario: serializer.fromJson<int?>(json['idUsuario']),
    );
  }
}
