import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/utils/db/json_serializer.dart';

class ConfiguracionDto {
  final int idConfiguracion;
  final int numeroJuego;
  final int carton;
  final String serie;
  final int balotas;
  final String? fechaRegistro;
  final int idUsuario;
  final String? estado;
  final String? fechaModificacion;
  final int reconfigurado;
  final String? clienteDefecto;

  ConfiguracionDto(
      {required this.idConfiguracion,
      required this.numeroJuego,
      required this.carton,
      required this.serie,
      required this.balotas,
      required this.fechaRegistro,
      required this.idUsuario,
      required this.estado,
      this.fechaModificacion,
      required this.reconfigurado,
      this.clienteDefecto});

  factory ConfiguracionDto.initial(String serie) {
    return ConfiguracionDto(
        idConfiguracion: 0,
        numeroJuego: 0,
        carton: 0,
        serie: '',
        balotas: 0,
        fechaRegistro: DateTime.now().toIso8601String(),
        idUsuario: 0,
        estado: serie,
        fechaModificacion: DateTime.now().toIso8601String(),
        reconfigurado: 0,
        clienteDefecto: '');
  }

  factory ConfiguracionDto.fromConfiguracion(Configuracion configuracion,
      {int idUsuario = 0}) {
    return ConfiguracionDto(
      idConfiguracion: configuracion.idConfiguracion,
      numeroJuego: configuracion.idProgramacionJuego,
      carton: configuracion.carton,
      serie: configuracion.serie ?? 'A',
      balotas: configuracion.balotas,
      fechaRegistro: (configuracion.fechaRegistro == null)
          ? null
          : configuracion.fechaRegistro!.toIso8601String(),
      idUsuario: configuracion.idUsuario,
      estado: configuracion.estado ?? 'A',
      fechaModificacion: (configuracion.fechaModificacion == null)
          ? null
          : configuracion.fechaModificacion!.toIso8601String(),
      reconfigurado: (configuracion.reconfigurado) ? 1 : 0,
      clienteDefecto: configuracion.clienteDefecto,
    );
  }

  static Configuracion toConfiguracion(ConfiguracionDto configuracionDTO) {
    return Configuracion(
        idConfiguracion: configuracionDTO.idConfiguracion,
        idProgramacionJuego: configuracionDTO.numeroJuego,
        carton: configuracionDTO.carton,
        serie: configuracionDTO.serie,
        balotas: configuracionDTO.balotas,
        fechaRegistro: configuracionDTO.fechaRegistro != null
            ? DateTime.parse(configuracionDTO.fechaRegistro!)
            : null,
        idUsuario: configuracionDTO.idUsuario,
        estado: configuracionDTO.estado,
        fechaModificacion: configuracionDTO.fechaModificacion == null
            ? null
            : DateTime.parse(configuracionDTO.fechaModificacion!),
        reconfigurado: (configuracionDTO.reconfigurado == 1),
        clienteDefecto: configuracionDTO.clienteDefecto);
  }

  static List<ConfiguracionDto> fromListConfiguraciones(
      List<Configuracion> clientes,
      {required int idUsuario}) {
    List<ConfiguracionDto> configuracionesDTO = [];

    for (var carton in clientes) {
      configuracionesDTO.add(
          ConfiguracionDto.fromConfiguracion(carton, idUsuario: idUsuario));
    }
    return configuracionesDTO;
  }

  Map<String, dynamic> toJson() {
    var serializer = const JsonSerializer();
    return <String, dynamic>{
      'idConfiguracion': serializer.toJson<int>(idConfiguracion),
      'numeroJuego': serializer.toJson<int>(numeroJuego),
      'carton': serializer.toJson<int>(carton),
      'serie': serializer.toJson<String>(serie),
      'balotas': serializer.toJson<int>(balotas),
      'fechaRegistro': serializer.toJson<String?>(fechaRegistro),
      'idUsuario': serializer.toJson<int>(idUsuario),
      'estado': serializer.toJson<String?>(estado),
      'fechaModificacion': serializer.toJson<String?>(fechaModificacion),
      'reconfigurado': serializer.toJson<int>(reconfigurado),
      'clienteDefecto': serializer.toJson<String?>(clienteDefecto),
    };
  }

  factory ConfiguracionDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    return ConfiguracionDto(
      idConfiguracion: serializer.fromJson<int>(json['idConfiguracion']),
      numeroJuego: serializer.fromJson<int>(json['numeroJuego']),
      carton: serializer.fromJson<int>(json['carton']),
      serie: serializer.fromJson<String>(json['serie']),
      balotas: serializer.fromJson<int>(json['balotas']),
      fechaRegistro: serializer.fromJson<String>(json['fechaRegistro']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      estado: serializer.fromJson<String>(json['estado']),
      fechaModificacion: serializer
          .fromJson<String>(json['fechaModificacion'] ?? json['fechaRegistro']),
      reconfigurado: serializer.fromJson<int>(json['reconfigurado']),
      clienteDefecto: serializer.fromJson<String>(json['clienteDefecto']),
    );
  }
}
