import 'package:socio/utils/db/json_serializer.dart';

class YapaDto {
  final int idYapa;
  final int idProgramacionJuego;
  final String nombre;
  final double valorPremio;
  final int orden;
  final String estado;
  final String aleatorio;
  final int carton;
  final DateTime? fechaAjuste;
  final int? idUsuario;

  YapaDto(
      {required this.idYapa,
      required this.idProgramacionJuego,
      required this.nombre,
      required this.valorPremio,
      required this.orden,
      required this.estado,
      required this.aleatorio,
      required this.carton,
      this.fechaAjuste,
      this.idUsuario});

  factory YapaDto.initial() {
    return YapaDto(
      idYapa: 0,
      idProgramacionJuego: 0,
      nombre: '',
      carton: 0,
      valorPremio: 0,
      orden: 1,
      aleatorio: 'S',
      estado: 'A',
      fechaAjuste: DateTime.now(),
      idUsuario: 1,
    );
  }

  factory YapaDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    var fechaAjuste = json['fechaAjuste'] != null
        ? DateTime.parse(json['fechaAjuste'])
        : null;

    String aleatorio = (json['aleatorio'] != null) ? json['aleatorio'] : 'S';
    return YapaDto(
      idYapa: serializer.fromJson<int>(json['idYapa']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      nombre: serializer.fromJson<String>(json['nombre']),
      orden: serializer.fromJson<int>(json['orden']),
      valorPremio: serializer.fromJson<double>(json['valorPremio']),
      estado: serializer.fromJson<String>(json['estado']),
      aleatorio: aleatorio,
      carton: serializer.fromJson<int>(json['carton']),
      fechaAjuste: fechaAjuste,
      idUsuario: serializer.fromJson<int?>(json['idUsuario']),
    );
  }

  static List<YapaDto> fromListJson(List<Map<String, dynamic>> jsonYapas) {
    List<YapaDto> listYapasDto = [];
    for (var jsonyapa in jsonYapas) {
      listYapasDto.add(YapaDto.fromJson(jsonyapa));
    }
    return listYapasDto;
  }

  Map<String, dynamic> toJson() {
    var serializer = const JsonSerializer();
    return <String, dynamic>{
      'idYapa': serializer.toJson<int>(idYapa),
      'idProgramacionJuego': serializer.toJson<int>(idProgramacionJuego),
      'nombre': serializer.toJson<String>(nombre),
      'orden': serializer.toJson<int>(orden),
      'valorPremio': serializer.toJson<double>(valorPremio),
      'estado': serializer.toJson<String>(estado),
      'aleatorio': serializer.toJson<String>(aleatorio),
      'carton': serializer.toJson<int>(carton),
      'fechaAjuste': serializer.toJson<String?>(null),
      'idUsuario': serializer.toJson<int>(idUsuario ?? 0),
    };
  }
}
