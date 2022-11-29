part of 'auditoria_acumulado_bloc.dart';

abstract class AuditoriaAcumuladoEvent extends Equatable {
  const AuditoriaAcumuladoEvent();

  @override
  List<Object> get props => [];
}

class GetAuditoriaAcumulado extends AuditoriaAcumuladoEvent {
  final int idProgramacionJuego;

  const GetAuditoriaAcumulado(this.idProgramacionJuego);

  @override
  List<Object> get props => [idProgramacionJuego];

  @override
  String toString() => 'GetAuditoriaAcumulado idJuego $idProgramacionJuego ';
}

class SelectAuditoriaAcumulado extends AuditoriaAcumuladoEvent {
  final InformePromedioVentasDto auditoria;

  const SelectAuditoriaAcumulado(this.auditoria);

  @override
  List<Object> get props => [auditoria];

  @override
  String toString() => 'SelectAuditoriaAcumulado';
}
