import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/utils/db/json_serializer.dart';

class ProgramacionJuegoDto {
  final int idProgramacionJuego;
  final String fechaProgramada;
  final int valorCarton;
  final int totalCartones;
  final int valorModulo;
  final int totalModulos;
  final int totalPremios;
  final int idSerie;
  final int cartonInicial;
  final int cartonFinal;
  final int hojaInicial;
  final int hojaFinal;
  final int resultadoFinal;
  final String estado;

  ProgramacionJuegoDto(
      {required this.idProgramacionJuego,
      required this.fechaProgramada,
      required this.valorCarton,
      required this.totalCartones,
      required this.valorModulo,
      required this.totalModulos,
      required this.totalPremios,
      required this.idSerie,
      required this.cartonInicial,
      required this.cartonFinal,
      required this.hojaInicial,
      required this.hojaFinal,
      required this.resultadoFinal,
      required this.estado});
}
