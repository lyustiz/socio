import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/utils/db/json_serializer.dart';

class FiguraDto {
  final int idFigura; //: 6,
  final int idPlenoAutomatico; //: 56,
  final String nombre;
  final String posiciones; //: 2 Esquinas 1,
  final String estado; //: A,
  final double valorPremio;
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
      valorPremio: serializer.fromJson<double>(json['valorPremio']),
      acumula: serializer.fromJson<String>(json['acumula']),
      fechaAjuste: fechaAjuste,
      idUsuario: serializer.fromJson<int?>(json['idUsuario']),
    );
  }

  factory FiguraDto.fromFigura(Figura figura) {
    return FiguraDto(
        idFigura: figura.idFigura,
        idPlenoAutomatico: figura.idPlenoAutomatico,
        nombre: figura.nombre,
        posiciones: figura.posiciones,
        estado: figura.estado,
        valorPremio: figura.valorPremio,
        acumula: figura.acumula ?? 'N',
        fechaAjuste: DateTime.now(),
        idUsuario: figura.idUsuario ?? 0);
  }

  Map<String, dynamic> toJson() {
    var serializer = const JsonSerializer();
    return <String, dynamic>{
      'idFigura': serializer.toJson<int>(idFigura),
      'idPlenoAutomatico': serializer.toJson<int>(idPlenoAutomatico),
      'nombre': serializer.toJson<String>(''),
      'posiciones': serializer.toJson<String>(''),
      'estado': serializer.toJson<String>(estado),
      'valorPremio': serializer.toJson<double>(0),
      'acumula': serializer.toJson<String>(acumula),
      'fechaAjuste': serializer.toJson<String?>(null),
      'idUsuario': serializer.toJson<int>(idUsuario ?? 0),
    };
  }

  Figura toFigura(int idProgramacionJuego) {
    return Figura(
      idFigura: idFigura,
      idPlenoAutomatico: idPlenoAutomatico,
      idProgramacionJuego: idProgramacionJuego,
      nombre: nombre,
      posiciones: posiciones,
      estado: estado,
      valorPremio: valorPremio,
      acumula: acumula,
      fechaAjuste: fechaAjuste,
      idUsuario: idUsuario,
    );
  }
}
