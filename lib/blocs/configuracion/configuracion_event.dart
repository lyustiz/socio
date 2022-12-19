part of 'configuracion_bloc.dart';

abstract class ConfiguracionEvent extends Equatable {
  const ConfiguracionEvent();

  @override
  List<Object> get props => [];
}

class GetConfiguracion extends ConfiguracionEvent {
  final int idProgramacionJuego;

  const GetConfiguracion(this.idProgramacionJuego);

  @override
  List<Object> get props => [idProgramacionJuego];

  @override
  String toString() => 'GetConfiguracion id $idProgramacionJuego';
}

class SetConfiguracion extends ConfiguracionEvent {
  final ConfiguracionDto configuracion;
  const SetConfiguracion(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'SetConfiguracion';
}

class GetAllConfiguracion extends ConfiguracionEvent {
  final String terminado;
  const GetAllConfiguracion(this.terminado);

  @override
  List<Object> get props => [terminado];

  @override
  String toString() => 'GetAllUsuario';
}

class UpdateConfiguracion extends ConfiguracionEvent {
  final ConfiguracionDto configuracion;

  const UpdateConfiguracion(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'UpdateConfiguracion';
}

class InsertConfiguracion extends ConfiguracionEvent {
  final ConfiguracionDto configuracion;

  const InsertConfiguracion(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'InsertConfiguracion';
}

class DeleteConfiguracion extends ConfiguracionEvent {
  final ConfiguracionDto configuracion;

  const DeleteConfiguracion(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'DeleteConfiguracion';
}

class SelectConfiguracion extends ConfiguracionEvent {
  final ConfiguracionDto configuracion;

  const SelectConfiguracion(this.configuracion);

  @override
  List<Object> get props => [configuracion];

  @override
  String toString() => 'SelectConfiguracion';
}
