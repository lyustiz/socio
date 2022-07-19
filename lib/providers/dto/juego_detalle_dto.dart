// ignore_for_file: file_names

import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/utils/db/json_serializer.dart';
import 'configuracion_dto.dart';
import 'programacion_juego_dto.dart';

class JuegoDetalleDto {
  final int idProgramacionJuego;
  final String tipoJuego;
  final String fechaProgramada;
  final int moduloCartones;
  final String moneda;
  final double valorCarton;
  final int totalCartones;
  final double valorModulo;
  final int totalModulos;
  final double totalPremios;
  final String serie;
  final int cartonInicial;
  final int cartonFinal;
  final int hojaInicial;
  final int hojaFinal;
  final String horaCierre;
  final int previoCierre;
  final String permitirDevolucion;
  final String estado;
  final int cartonesAsignados;
  final int cartonesVendidos;
  final int modulosAsignados;
  final int modulosVendidos;
  final int numeroVendedores;
  final List<Figura> figuras;
  final ConfiguracionDto? configuracion;
  final List<ProgramacionJuegoDto> programacionesJuego;

  JuegoDetalleDto({
    required this.idProgramacionJuego,
    required this.tipoJuego,
    required this.fechaProgramada,
    required this.moduloCartones,
    required this.moneda,
    required this.valorCarton,
    required this.totalCartones,
    required this.valorModulo,
    required this.totalModulos,
    required this.totalPremios,
    required this.serie,
    required this.cartonInicial,
    required this.cartonFinal,
    required this.hojaInicial,
    required this.hojaFinal,
    required this.horaCierre,
    required this.previoCierre,
    required this.permitirDevolucion,
    required this.estado,
    required this.cartonesAsignados,
    required this.cartonesVendidos,
    required this.modulosAsignados,
    required this.modulosVendidos,
    required this.numeroVendedores,
    required this.figuras,
    this.configuracion,
    required this.programacionesJuego,
  });

  factory JuegoDetalleDto.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    var figuras = json['premios'];
    var programaciones = json['programacionjuegos'];
    var config = json['configuracion'];

    List<Figura> listFiguras = [];
    List<ProgramacionJuegoDto> listProgramacionJuego = [];
    ConfiguracionDto? configDTO = null;

    if (figuras != null) {
      figuras.forEach((premio) {
        listFiguras.add(Figura(
          idFigura: premio['idFigura'],
          idProgramacionJuego:
              serializer.fromJson<int>(json['idProgramacionJuego']),
          idPlenoAutomatico: premio['idPlenoAutomatico'],
          nombre: premio['nombre'],
          posiciones: premio['posiciones'],
          valorPremio: double.parse(premio['valorPremio'].toString()),
          estado: premio['estado'],
          actualizado: premio['actualizado'] ?? DateTime.now(),
        ));
      });
    }

    if (programaciones != null) {
      for (var pjuego in programaciones) {
        ProgramacionJuegoDto addProgramacion = ProgramacionJuegoDto(
            idProgramacionJuego: pjuego['idProgramacionJuego'],
            fechaProgramada: pjuego['fechaProgramada'],
            valorCarton: pjuego['valorCarton'],
            totalCartones: pjuego['totalCartones'],
            valorModulo: pjuego['valorModulo'],
            totalModulos: pjuego['totalModulos'],
            totalPremios: pjuego['totalPremios'],
            idSerie: pjuego['idSerie'],
            cartonInicial: pjuego['cartonInicial'],
            cartonFinal: pjuego['cartonFinal'],
            hojaInicial: pjuego['hojaInicial'],
            hojaFinal: pjuego['hojaFinal'],
            resultadoFinal: pjuego['resultadoFinal'],
            estado: pjuego['estado']);
        listProgramacionJuego.add(addProgramacion);
      }
    }

    if (config != null) {
      if (config['idConfiguracion'] != 0) {
        configDTO = ConfiguracionDto(
            idConfiguracion: config['idConfiguracion'],
            numeroJuego: config['numeroJuego'],
            carton: config['carton'],
            serie: config['idSerie'].toString(),
            balotas: config['balotas'],
            fechaRegistro: config['fechaRegistro'],
            idUsuario: config['idUsuario'],
            estado: config['estado'],
            reconfigurado: 1);
      }
    }

    return JuegoDetalleDto(
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      tipoJuego: serializer.fromJson<String>(json['tipoJuego']),
      fechaProgramada: serializer.fromJson<String>(json['fechaProgramada']),
      moduloCartones: serializer.fromJson<int>(json['moduloCartones']),
      moneda: serializer.fromJson<String>(json['moneda']),
      valorCarton: serializer.fromJson<double>(json['valorCarton']),
      totalCartones: serializer.fromJson<int>(json['totalCartones']),
      valorModulo: serializer.fromJson<double>(json['valorModulo']),
      totalModulos: serializer.fromJson<int>(json['totalModulos']),
      totalPremios: serializer.fromJson<double>(json['totalPremios']),
      serie: serializer.fromJson<String>(json['serie']),
      cartonInicial: serializer.fromJson<int>(json['cartonInicial']),
      cartonFinal: serializer.fromJson<int>(json['cartonFinal']),
      hojaInicial: serializer.fromJson<int>(json['hojaInicial']),
      hojaFinal: serializer.fromJson<int>(json['hojaFinal']),
      horaCierre: serializer.fromJson<String>(json['horaCierre']),
      previoCierre: serializer.fromJson<int>(json['previoCierre']),
      permitirDevolucion:
          serializer.fromJson<String>(json['permitirDevolucion']),
      estado: serializer.fromJson<String>(json['estado']),
      cartonesAsignados: serializer.fromJson<int>(json['cartonesAsignados']),
      cartonesVendidos: serializer.fromJson<int>(json['cartonesVendidos']),
      modulosAsignados: serializer.fromJson<int>(json['modulosAsignados']),
      modulosVendidos: serializer.fromJson<int>(json['modulosVendidos']),
      numeroVendedores: serializer.fromJson<int>(json['numeroVendedores']),
      figuras: listFiguras,
      configuracion: configDTO,
      programacionesJuego: listProgramacionJuego,
    );
  }

  static JuegosWithDetalles toJuegosWithDetalles(JuegoDetalleDto juegoDTO) {
    bool hasParams = juegoDTO.programacionesJuego.isNotEmpty;
    bool hasConfig = juegoDTO.configuracion is ConfiguracionDto;

    Juego juego = Juego(
      idProgramacionJuego: juegoDTO.idProgramacionJuego,
      tipoJuego: juegoDTO.tipoJuego,
      fechaProgramada: DateTime.parse(juegoDTO.fechaProgramada),
      moduloCartones: juegoDTO.moduloCartones,
      moneda: juegoDTO.moneda,
      valorCarton: juegoDTO.valorCarton,
      totalCartones: juegoDTO.totalCartones,
      valorModulo: juegoDTO.valorModulo,
      totalModulos: juegoDTO.totalModulos,
      totalPremios: juegoDTO.totalPremios,
      serie: juegoDTO.serie,
      cartonInicial: juegoDTO.cartonInicial,
      cartonFinal: juegoDTO.cartonFinal,
      hojaInicial: juegoDTO.hojaInicial,
      hojaFinal: juegoDTO.hojaFinal,
      horaCierre: DateTime.parse(juegoDTO.horaCierre),
      previoCierre: juegoDTO.previoCierre,
      permitirDevolucion: juegoDTO.permitirDevolucion,
      estado: juegoDTO.estado,
    );

    List<Figura> listFiguras = [];

    juegoDTO.figuras.forEach((premio) {
      Figura addPremio = Figura(
        idFigura: premio.idFigura,
        idProgramacionJuego: premio.idProgramacionJuego,
        idPlenoAutomatico: premio.idPlenoAutomatico,
        nombre: premio.nombre,
        posiciones: premio.posiciones,
        valorPremio: premio.valorPremio,
        estado: premio.estado,
        actualizado: premio.actualizado,
      );
      listFiguras.add(addPremio);
    });

    List<ProgramacionJuego> listProgramacionJuego = [];

    for (var pjuego in juegoDTO.programacionesJuego) {
      ProgramacionJuego addProgramacion = ProgramacionJuego(
          idProgramacionJuego: pjuego.idProgramacionJuego,
          fechaProgramada: pjuego.fechaProgramada,
          valorCarton: pjuego.valorCarton,
          totalCartones: pjuego.totalCartones,
          valorModulo: pjuego.valorModulo,
          totalModulos: pjuego.totalModulos,
          totalPremios: pjuego.totalPremios,
          idSerie: pjuego.idSerie,
          cartonInicial: pjuego.cartonInicial,
          cartonFinal: pjuego.cartonFinal,
          hojaInicial: pjuego.hojaInicial,
          hojaFinal: pjuego.hojaFinal,
          resultadoFinal: pjuego.resultadoFinal,
          estado: pjuego.estado);
      listProgramacionJuego.add(addProgramacion);
    }

    Configuracion? config;

    if (hasConfig) {
      var jc = juegoDTO.configuracion;
      config = Configuracion(
          idConfiguracion: jc!.idConfiguracion,
          idProgramacionJuego: juego.idProgramacionJuego,
          carton: jc.carton,
          serie: jc.serie,
          balotas: jc.balotas,
          fechaRegistro: jc.fechaRegistro != null
              ? DateTime.parse(jc.fechaRegistro!)
              : null,
          idUsuario: jc.idUsuario,
          estado: jc.estado,
          reconfigurado: jc.reconfigurado == 1);
    }

    return JuegosWithDetalles(
        juego: juego,
        totalCartones: juegoDTO.totalCartones,
        cartonesAsignados: juegoDTO.cartonesAsignados,
        cartonesVendidos: juegoDTO.cartonesVendidos,
        totalModulos: juegoDTO.totalModulos,
        modulosAsignados: juegoDTO.modulosAsignados,
        modulosVendidos: juegoDTO.modulosVendidos,
        numeroVendedores: juegoDTO.numeroVendedores,
        premios: listFiguras,
        configuracion: config,
        programacionJuego: listProgramacionJuego);
  }
}
