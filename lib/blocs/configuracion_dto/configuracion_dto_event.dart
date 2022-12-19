part of 'configuracion_dto_bloc.dart';

abstract class ConfiguracionDtoEvent extends Equatable {
  const ConfiguracionDtoEvent();

  @override
  List<Object> get props => [];
}

class GetConfiguracionDto extends ConfiguracionDtoEvent {
  final int idProgramacionJuego;

  const GetConfiguracionDto(this.idProgramacionJuego);

  @override
  List<Object> get props => [idProgramacionJuego];

  @override
  String toString() => 'GetConfiguracionDto idJuego $idProgramacionJuego ';
}
