part of 'auditoria_configuracion_bloc.dart';

abstract class AuditoriaConfiguracionEvent extends Equatable {
  const AuditoriaConfiguracionEvent();

  @override
  List<Object> get props => [];
}

class GetAuditoriaConfiguracion extends AuditoriaConfiguracionEvent {
  final int idProgramacionJuego;

  const GetAuditoriaConfiguracion(this.idProgramacionJuego);

  @override
  List<Object> get props => [idProgramacionJuego];

  @override
  String toString() =>
      'GetAuditoriaConfiguracion idJuego $idProgramacionJuego ';
}

class SelectAuditoriaConfiguracion extends AuditoriaConfiguracionEvent {
  final AuditoriaConfiguracionDto auditoria;

  const SelectAuditoriaConfiguracion(this.auditoria);

  @override
  List<Object> get props => [auditoria];

  @override
  String toString() => 'SelectAuditoriaConfiguracion';
}
